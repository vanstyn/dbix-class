use strict;
use warnings;

use lib qw(t/lib);

use Test::More;
use DBICTest;
use Data::Dumper::Concise 'Dumper';

my $schema = DBICTest->init_schema();


my $ArtistRs = $schema->resultset("Artist");
my $CdRs     = $schema->resultset("CD");

my $cd_rel_rs = $CdRs->search_rs(
  { 'me.artistid' => { -ident => 'cd_alias.artist' } },
  { alias         => "cd_alias" }
);

my $rs = $ArtistRs->search_rs(undef,{
  result_class => 'DBIx::Class::ResultClass::HashRefInflator'
});


#################
## --- rs1 --- ##
#################

my $rs1 = $rs->search_rs(undef,{
  '+select'    => [{ '' => $cd_rel_rs->count_rs->as_query, -as => 'cd_count' }],
  '+as'        => ['cd_count'],
});

my $expect_rows_rs1 = [
  {
    'artistid' => 1,
    'charfield' => undef,
    'name' => 'Caterwauler McCrae',
    'rank' => 13,
    'cd_count' => 3
  },
  {
    'artistid' => 2,
    'charfield' => undef,
    'name' => 'Random Boy Band',
    'rank' => 13,
    'cd_count' => 1
  },
  {
    'artistid' => 3,
    'charfield' => undef,
    'name' => 'We Are Goth',
    'rank' => 13,
    'cd_count' => 1
  }
];

is_deeply(
  [ $rs1->all ] => $expect_rows_rs1,
  'rs1: Expected artist rows w/ "cd_count" sub-select virtual column'
);


#################
## --- rs2 --- ##
#################

my $rs2 = $rs1->search_rs(undef,{
  join      => 'cds',
  group_by  => 'me.artistid',
  '+select' => [{ max => 'cds.year', -as => 'newest_cd_year' }],
  '+as'     => ['newest_cd_year'],
});

my $expect_rows_rs2 = [
  {
    'artistid' => 1,
    'charfield' => undef,
    'name' => 'Caterwauler McCrae',
    'newest_cd_year' => '2001',
    'rank' => 13,
    'cd_count' => 3
  },
  {
    'artistid' => 2,
    'charfield' => undef,
    'name' => 'Random Boy Band',
    'newest_cd_year' => '2001',
    'rank' => 13,
    'cd_count' => 1
  },
  {
    'artistid' => 3,
    'charfield' => undef,
    'name' => 'We Are Goth',
    'newest_cd_year' => '1998',
    'rank' => 13,
    'cd_count' => 1
  }
];

is_deeply(
  [ $rs2->all ] => $expect_rows_rs2,
  'rs2: Expected artist rows w/ "newest_cd_year" (join/group_by/max) virtual column'
);


#################
## --- rs3 --- ##
#################

my $rs3 = $rs2->search_rs(undef,{
  having => { 'newest_cd_year' => [ '1998', '2001' ] }
});

is_deeply(
  [ $rs3->all ] => $expect_rows_rs2,
  'rs3: HAVING clause selects same rows as rs2'
);


#################
## --- rs4 --- ##
#################

my $rs4 = $rs2->search_rs(undef,{
  having => { 'newest_cd_year' => [ '1998', '2008' ] }
});

# Only 1998 row:
my $expect_rows_rs4 = [ grep { $_->{newest_cd_year} eq '1998' } @$expect_rows_rs2 ];

is_deeply(
  $expect_rows_rs4 => [{
    'artistid' => 3,
    'charfield' => undef,
    'name' => 'We Are Goth',
    'newest_cd_year' => '1998',
    'rank' => 13,
    'cd_count' => 1
  }],
  'rs4: The rows we expect are the rows we expect...'
);

is_deeply(
  [ $rs4->all ] => $expect_rows_rs4,
  'rs4: HAVING clause finds expected 1998 row'
);

is(
  $rs4->count => 1,
  "rs4: count '1' row"
);



#################
## --- rs5 --- ##
#################

my $rs5 = $rs2->search_rs(undef,{
  having => { 'cd_count' => { '>' => 2 } }
});

# Only rows with 'cd_count' greater than 2 (should be 1 row)
my $expect_rows_rs5 = [ grep { $_->{cd_count} > 2 } @$expect_rows_rs2 ];

is_deeply(
  $expect_rows_rs5 => [{
    artistid => 1,
    cd_count => 3,
    charfield => undef,
    name => "Caterwauler McCrae",
    newest_cd_year => 2001,
    rank => 13
  }],
  'rs5: The rows we expect are the rows we expect...'
);


# But this fails!!! Returns 0 rows!!! WHY????
is_deeply(
  [ $rs5->all ] => $expect_rows_rs5,
  'rs5: HAVING clause finds expected row with cd_count greater than 2'
);

is(
  $rs5->count => 1,
  "rs5: count '1' row"
);



#################
## --- rs6 --- ##
#################

# Back up, and try again, starting from rs1 (i.e. without the join/group_by/max)

my $rs6 = $rs1->search_rs(undef,{
  group_by => 'me.artistid',
  having   => { 'cd_count' => { '>' => 2 } }
});

# Only rows with 'cd_count' greater than 2 (should be 1 row)
my $expect_rows_rs6 = [ grep {
  delete $_->{newest_cd_year}; #<-- delete from every row
  $_->{cd_count} > 2 
} @$expect_rows_rs2 ];

is_deeply(
  $expect_rows_rs6 => [{
    artistid => 1,
    cd_count => 3,
    charfield => undef,
    name => "Caterwauler McCrae",
    rank => 13
  }],
  'rs6: The rows we expect are the rows we expect...'
);


# But this fails, too. Returns 0 rows. So, its not the join...
is_deeply(
  [ $rs6->all ] => $expect_rows_rs6,
  'rs5: HAVING clause finds expected row with cd_count greater than 2'
);

is(
  $rs6->count => 1,
  "rs6: count '1' row"
);


# So, I haven't even gotten to a scenario to reproduce the thing I am
# actually trying to investigate, which is the $rs->count breaking with
# a HAVING clause, but not with a WHERE clause, but working when 
# wrapped/chained through as_subselect_rs ... It happens, I've seen it
# happen, but I can't figure out what is special in these production
# cases to show it happening here (if I could, I'd probably already see
# the actual stupid bug in what *I'm* doing wrong)
# 


done_testing;
