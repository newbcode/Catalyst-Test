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

=head2 list
 
Fetch all book objects and pass to books/list.tt2 in stash to be displayed
 
=cut
 
sub list :Local {
    # Retrieve the usual Perl OO '$self' for this object. $c is the Catalyst
    # 'Context' that's used to 'glue together' the various components
    # that make up the application
    my ($self, $c) = @_;
 
    # Retrieve all of the book records as book model objects and store in the
    # stash where they can be accessed by the TT template
    # $c->stash(books => [$c->model('DB::Book')->all]);
    # But, for now, use this code until we create the model later
    $c->stash(books => [$c->model('DB::Book')->all]);
 
    # Set the TT template to use.  You will almost always want to do this
    # in your action methods (action methods respond to user input in
    # your controllers).
    #$c->stash(template => 'books/list.tt2');
}

=head2 delete
 
Delete a book
 
=cut
 
sub delete :Chained('object') :PathPart('delete') :Args(0) {
    my ($self, $c) = @_;
 
    # Saved the PK id for status_msg below
    my $id = $c->stash->{object}->id;
 
    # Use the book object saved by 'object' and delete it along
    # with related 'book_authors' entries
    $c->stash->{object}->delete;
 
    # Redirect the user back to the list page
    $c->response->redirect($c->uri_for($self->action_for('list'),
        {mid => $c->set_status_msg("Deleted book $id")}));
}

sub base :Chained('/') :PathPart('books') :CaptureArgs(0) {
    my ($self, $c) = @_;
 
    # Store the ResultSet in stash so it's available for other methods
    $c->stash(resultset => $c->model('DB::Book'));
 
    # Print a message to the debug log
    $c->log->debug('*** INSIDE BASE METHOD ***');
 
    # Load status messages
    $c->load_status_msgs;
}

=head1 AUTHOR

kangyunchang,,,

=head1 LICENSE

This library is free software. You can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

__PACKAGE__->meta->make_immutable;

1;
