require File::Spec;
my $ddl_fn = File::Spec->catfile(qw(t lib sqlite.sql));

# If the author doesn't have the prereqs, we will end up obliterating
# the ddl file, and all tests will fail, therefore don't do anything
# on error
# The EUMM build-stage generation will run unconditionally and
# errors will not be trapped
require DBIx::Class::Optional::Dependencies;
if ( DBIx::Class::Optional::Dependencies->req_ok_for ('deploy') ) {
  print "Regenerating t/lib/sqlite.sql\n";
  if (my $out = ` "$^X" -Ilib maint/gen_schema `) {
    open (my $fh, '>:unix', $ddl_fn) or die "Unable to open $ddl_fn: $!";
    print $fh $out;
    close $fh;

    # if we don't do it some git tools (e.g. gitk) get confused that the
    # ddl file is modified, when it clearly isn't
    system('git status --porcelain >' . File::Spec->devnull);
  }
}

postamble <<"EOP";

clonedir_generate_files : dbic_clonedir_regen_test_ddl

dbic_clonedir_regen_test_ddl :
\t\$(ABSPERLRUN) -Ilib -- maint/gen_schema > @{[ $mm_proto->quote_literal($ddl_fn) ]}
@{[ $crlf_fixup->($ddl_fn) ]}
EOP

# keep the Makefile.PL eval happy
1;
