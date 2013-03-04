package MyApp::Controller::Books;
use Moose;
use namespace::autoclean;

BEGIN { extends 'Catalyst::Controller'; }

=head1 NAME

MyApp::Controller::Books - Catalyst Controller

=head1 DESCRIPTION

Catalyst Controller.

=head1 METHODS

=cut


=head2 index

=cut

sub index :Path :Args(0) {
    my ( $self, $c ) = @_;
    $c->response->body('Matched MyApp::Controller::Books in Books.');
}

sub list :Local {
    my ($self, $c) = @_;
    $c->stash(books => [$c->model('DB::Book')->all]);
    $c->stash(template => 'books/list.tt2');
#     $c->model('DB')->resultset('Book')
#    $c->model('DB::Book')->search();

}


=head1 AUTHOR

kangyunchang,,,

=head1 LICENSE

This library is free software. You can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

__PACKAGE__->meta->make_immutable;

1;
