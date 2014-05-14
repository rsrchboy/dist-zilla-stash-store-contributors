package Dist::Zilla::Stash::Store::Contributors;

# ABSTRACT: The great new Dist::Zilla::Stash::Store::Contributors!

use Moose;
use namespace::autoclean;
use MooseX::AttributeShortcuts;
use MooseX::Types::Moose ':all';

with 'Dist::Zilla::Role::Store';

use constant ProviderRole => '-ContributorStash::Provider';

=attribute contributors

Contains a list of contributors (as strings), as returned by consumers of the
L<Dist::Zilla::Role::ContributorStore::Provider> role.

=method contributors()

This is a read-only accessor to the L</contributors> attribute.

=method has_contributors

True if we have any contributors.

This is a read-only accessor to the L</contributors> attribute.

=cut

has contributors => (

    traits  => [ 'Array' ],
    is      => 'lazy',
    isa     => ArrayRef[Str],
    clearer => 1,
    handles => { has_contributors => 'count' },
    builder => sub {
        ...
    },
);


__PACKAGE__->meta->make_immutable;
!!42;
__END__

=head1 SYNOPSIS

=head1 DESCRIPTION

=head1 SEE ALSO

=cut
