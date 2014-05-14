package Dist::Zilla::Role::ContributorStore::Consumer;

# ABSTRACT: Mark a dzil thing as a consumer of %Store::Contributors

use Moose::Role;
use namespace::autoclean;
use MooseX::AttributeShortcuts;

with 'Dist::Zilla::Role::RegisterStash';

=attr _contributor_store

A lazily populated attribute containing our
L<%Store::Contributors stash|Dist::Zilla::Stash::Store::Contributors>
instance.

=method _contributor_store()

This is a read-only accessor to the L</_contributor_store> attribute.

=method _contributors

Returns the list of contributors as kept in
L<Dist::Zilla::Stash::Store::Contributors/contributors>.

This is a method delegated to
L<Dist::Zilla::Stash::Store::Contributors/contributors()>.

=cut

has _contributor_store => (
    is              => 'lazy',
    isa_instance_of => 'Dist::Zilla::Stash::Store::Contributors',
    builder         => sub { shift->_retrieve_or_register('%Store::Contributors') },
    handles         => { _contributors => 'contributors' },
);

!!42;
__END__

=head1 SYNOPSIS

    # in your dzil thing, generally a plugin:
    package Dist::Zilla::Plugin::Thingie;

    with 'Dist::Zilla::Role::Plugin';
    with 'Dist::Zilla::Role::ContributorStore::Consumer';


    # and down the line:
    $self->_contributor_store->...;

    # ...or:
    $self->_contributors;

=head1 DESCRIPTION

This is a small role that marks a L<Dist::Zilla> "thing", generally but not always a
L<plugin|Dist::Zilla::Role::Plugin>, as a consumer of the
L<%Store::Contributors stash|Dist::Zilla::Stash::Store::Contributors>.

=cut
