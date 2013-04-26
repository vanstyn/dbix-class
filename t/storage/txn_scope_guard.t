use strict;
use warnings;

use Test::More;
use Test::Warn;
use Test::Exception;
use lib qw(t/lib);
use DBICTest;

# Test txn_scope_guard
{
  my $schema = DBICTest->init_schema();

  is($schema->storage->transaction_depth, 0, "Correct transaction depth");
  my $artist_rs = $schema->resultset('Artist');

  my $fn = __FILE__;
  throws_ok {
   my $guard = $schema->txn_scope_guard;

    $artist_rs->create({
      name => 'Death Cab for Cutie',
      made_up_column => 1,
    });

   $guard->commit;
  } qr/No such column 'made_up_column' .*? at .*?\Q$fn\E line \d+/s, "Error propogated okay";

  ok(!$artist_rs->find({name => 'Death Cab for Cutie'}), "Artist not created");

  my $inner_exception = '';  # set in inner() below
  throws_ok (sub {
    outer($schema, 1);
  }, qr/$inner_exception/, "Nested exceptions propogated");

  ok(!$artist_rs->find({name => 'Death Cab for Cutie'}), "Artist not created");

  lives_ok (sub {

    # this weird assignment is to stop perl <= 5.8.9 leaking $schema on nested sub{}s
    my $s = $schema;

    warnings_exist ( sub {
      # The 0 arg says don't die, just let the scope guard go out of scope
      # forcing a txn_rollback to happen
      outer($s, 0);
    }, qr/A DBIx::Class::Storage::TxnScopeGuard went out of scope without explicit commit or error. Rolling back./, 'Out of scope warning detected');

    ok(!$artist_rs->find({name => 'Death Cab for Cutie'}), "Artist not created");

  }, 'rollback successful withot exception');

  sub outer {
    my ($schema, $fatal) = @_;

    my $guard = $schema->txn_scope_guard;
    $schema->resultset('Artist')->create({
      name => 'Death Cab for Cutie',
    });
    inner($schema, $fatal);
  }

  sub inner {
    my ($schema, $fatal) = @_;

    my $inner_guard = $schema->txn_scope_guard;
    is($schema->storage->transaction_depth, 2, "Correct transaction depth");

    my $artist = $schema->resultset('Artist')->find({ name => 'Death Cab for Cutie' });

    eval {
      $artist->cds->create({
        title => 'Plans',
        year => 2005,
        $fatal ? ( foo => 'bar' ) : ()
      });
    };
    if ($@) {
      # Record what got thrown so we can test it propgates out properly.
      $inner_exception = $@;
      die $@;
    }

    # inner guard should commit without consequences
    $inner_guard->commit;
  }
}

# make sure the guard does not eat exceptions
{
  my $schema = DBICTest->init_schema;

  no strict 'refs';
  no warnings 'redefine';

  local *{DBIx::Class::Storage::DBI::txn_rollback} = sub { die 'die die my darling' };
  Class::C3->reinitialize() if DBIx::Class::_ENV_::OLD_MRO;

  throws_ok (sub {
    my $guard = $schema->txn_scope_guard;
    $schema->resultset ('Artist')->create ({ name => 'bohhoo'});

    # this should freak out the guard rollback
    # but it won't work because DBD::SQLite is buggy
    # instead just install a toxic rollback above
    #$schema->storage->_dbh( $schema->storage->_dbh->clone );

    die 'Deliberate exception';
  }, ($] >= 5.013008 )
    ? qr/Deliberate exception/s # temporary until we get the generic exception wrapper rolling
    : qr/Deliberate exception.+Rollback failed/s
  );

  # just to mask off warning since we could not disconnect above
  $schema->storage->_dbh->disconnect;
}

# make sure it warns *big* on failed rollbacks
# test with and without a poisoned $@
for my $pre_poison (0,1) {
for my $post_poison (0,1) {

  my $schema = DBICTest->init_schema(no_populate => 1);

  no strict 'refs';
  no warnings 'redefine';
  local *{DBIx::Class::Storage::DBI::txn_rollback} = sub { die 'die die my darling' };
  Class::C3->reinitialize() if DBIx::Class::_ENV_::OLD_MRO;

#The warn from within a DESTROY callback freaks out Test::Warn, do it old-school
=begin
  warnings_exist (
    sub {
      my $guard = $schema->txn_scope_guard;
      $schema->resultset ('Artist')->create ({ name => 'bohhoo'});

      # this should freak out the guard rollback
      # but it won't work because DBD::SQLite is buggy
      # instead just install a toxic rollback above
      #$schema->storage->_dbh( $schema->storage->_dbh->clone );
    },
    [
      qr/A DBIx::Class::Storage::TxnScopeGuard went out of scope without explicit commit or error. Rolling back./,
      qr/\*+ ROLLBACK FAILED\!\!\! \*+/,
    ],
    'proper warnings generated on out-of-scope+rollback failure'
  );
=cut

# delete this once the above works properly (same test)
  my @want = (
    qr/A DBIx::Class::Storage::TxnScopeGuard went out of scope without explicit commit or error. Rolling back./,
    qr/\*+ ROLLBACK FAILED\!\!\! \*+/,
  );

  my @w;
  local $SIG{__WARN__} = sub {
    if (grep {$_[0] =~ $_} (@want)) {
      push @w, $_[0];
    }
    else {
      warn $_[0];
    }
  };

  {
    eval { die 'pre-GIFT!' if $pre_poison };
    my $guard = $schema->txn_scope_guard;
    eval { die 'post-GIFT!' if $post_poison };
    $schema->resultset ('Artist')->create ({ name => 'bohhoo'});
  }

  local $TODO = 'Do not know how to deal with trapped exceptions occuring after guard instantiation...'
    if ( $post_poison and (
      # take no chances on installation
      ( DBICTest::RunMode->is_plain and ($ENV{TRAVIS}||'') ne 'true' )
        or
      # this always fails
      ! $pre_poison
        or
      # I do not underdtand why but on <= 5.8.8 and $pre_poison && $post_poison passes...
      $] > 5.008008
    ));

  is (@w, 2, "Both expected warnings found - \$\@ pre-poison: $pre_poison, post-poison: $post_poison" );

  # just to mask off warning since we could not disconnect above
  $schema->storage->_dbh->disconnect;
}}

# add a TODO to catch when Text::Balanced is finally fixed
# https://rt.cpan.org/Public/Bug/Display.html?id=74994
#
# while it doesn't matter much for DBIC itself, this particular bug
# is a *BANE*, and DBIC is to bump its dep as soon as possible
{

  require Text::Balanced;

  my $great_success;
  {
    local $TODO = 'RT#74994 *STILL* not fixed';

    lives_ok {
      # this is what poisons $@
      Text::Balanced::extract_bracketed( '(foo', '()' );

      my $s = DBICTest->init_schema( deploy => 0 );
      my $g = $s->txn_scope_guard;
      $g->commit;
      $great_success++;
    } 'Text::Balanced is no longer screwing up $@';
  }

  # delete all of this when T::B dep is bumped
  unless ($great_success) {

# hacky workaround for desperate folk
# intended to be copypasted into your app
    {
      require Text::Balanced;
      require overload;

      local $@;

      # this is what poisons $@
      Text::Balanced::extract_bracketed( '(foo', '()' );

      if ($@ and overload::Overloaded($@) and ! overload::Method($@,'fallback') ) {
        my $class = ref $@;
        eval "package $class; overload->import(fallback => 1);"
      }
    }
# end of hacky workaround

    lives_ok {
      # this is what poisons $@
      Text::Balanced::extract_bracketed( '(foo', '()' );

      my $s = DBICTest->init_schema( deploy => 0 );
      my $g = $s->txn_scope_guard;
      $g->commit;
    } 'Monkeypatched Text::Balanced is no longer screwing up $@';
  }
}

done_testing;
