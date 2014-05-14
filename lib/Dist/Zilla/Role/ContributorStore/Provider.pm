package Dist::Zilla::Role::ContributorStore::Provider;

# ABSTRACT: Marker for a dzil "thing" that provides a contributor list

use Moose::Role;
use namespace::autoclean;
use MooseX::AttributeShortcuts;

=required_method contributors_list

This required method should return a list of contributors;
either as strings or things that will stringify nicely.

=cut

requires 'contributors_list';

!!42;
__END__

=head1 SYNOPSIS

    # to provide a list of contributors:
	with 'Dist::Zilla::Role::ContributorStore::Provider';

	# ...and:
	sub contributors_list { ( ... ) }

=head1 DESCRIPTION

Simple role to mark a L<Dist::Zilla> "thing" as a provider of a contributor list to
L<%Store::Contributors|Dist::Zilla::Stash::Store::Contributors>.

=cut
