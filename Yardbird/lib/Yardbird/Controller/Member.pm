package Yardbird::Controller::Member;
use Moose;
use namespace::autoclean;

BEGIN { extends 'Catalyst::Controller'; }

has 'form' => (
  isa => 'Yardbird::Form::User',
  is => 'rw',
  lazy => 1,
  default => sub { Yardbird::Form::User->new }
);

=head1 NAME

Yardbird::Controller::Member - Catalyst Controller

=head1 DESCRIPTION

Catalyst Controller.

=head1 METHODS

=cut


=head2 index

=cut

sub index :Path :Args(0) {
    my ( $self, $c ) = @_;

    $c->response->body('Matched Yardbird::Controller::Member in Member.');
}

sub about :Local :Args(0) {
  my ( $self, $c ) = @_;

  $c->detach($c->view("TT"));
}

sub create :Local {
  my ( $self, $c, $user_id ) = @_;

  $c->stash(template => 'member/create.tt', form => $self->form );

  # Validate and insert data into database
  return unless $self->form->process(
    item_id => $user_id,
    params => $c->req->parameters,
    schema => $c->model('DB')->schema
  );

  # Form validated, return to home
  $c->res->redirect($c->uri_for_action('/index'));
}

=head1 AUTHOR

newbcode,,,

=head1 LICENSE

This library is free software. You can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

__PACKAGE__->meta->make_immutable;

1;
