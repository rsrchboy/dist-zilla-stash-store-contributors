use strict;
use warnings;

use Test::More;
use Test::Moose::More;

use aliased 'Dist::Zilla::Stash::Store::Contributors';
use aliased 'Dist::Zilla::Role::ContributorStore::Consumer';
use aliased 'Dist::Zilla::Role::ContributorStore::Provider';

validate_class Contributors() => (
    does       => [ 'Dist::Zilla::Role::Store' ],
    attributes => [ 'contributors' ],
);

validate_role Consumer() => (
    attributes => [

        _contributor_store => {
            
            reader => '_contributor_store',
            writer   => undef,
            accessor => undef,
            lazy     => 1,
            builder  => '_build_contributor_store',
            # XXX needs TMM change; not an error at the moment
            handles  => [ '_contributors' ],
        },
    ],
);

validate_role Provider() => (
	required_methods => [ 'contributors_list' ],
);

done_testing;
