package HATS::Controller::Issue;
use Moose;
use namespace::autoclean;

BEGIN { extends 'Catalyst::Controller'; }

=head1 NAME

HATS::Controller::Issue - Catalyst Controller

=head1 DESCRIPTION

Catalyst Controller.

=head1 METHODS

=cut


=head2 index

=cut

sub index :Path :Args(1) {
    my ( $self, $c, $num ) = @_;
    if ( $num =~ /^[0-9]+$/ ) { 
        $c->detach('issue_number');
    }
}

sub issues :Global {
    my ( $self, $c ) = @_;

    $c->response->body('Hello Global');
}

sub issue_number :Private {
    my ( $self, $c, $num ) = @_;

    $c->response->body("I am issue_number $num ");
}
=head1 AUTHOR

kangyunchang,,,

=head1 LICENSE

This library is free software. You can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

__PACKAGE__->meta->make_immutable;

1;
