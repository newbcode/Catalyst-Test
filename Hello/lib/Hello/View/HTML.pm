package Hello::View::HTML;
use Moose;
use namespace::autoclean;

extends 'Catalyst::View::TT';

__PACKAGE__->config(
    TEMPLATE_EXTENSION => '.tt2',
    render_die => 1,
);

__PACKAGE__->config(
     name => 'MyApp',
     # Disable deprecated behavior needed by old applications
     disable_component_resolution_regex_fallback => 1,
);

__PACKAGE__->config(
     'View::HTML' => {
          INCLUDE_PATH => [
             __PACKAGE__->path_to( 'root', 'src' ),
          ],
    },
);
 
=head1 NAME

Hello::View::HTML - TT View for Hello

=head1 DESCRIPTION

TT View for Hello.

=head1 SEE ALSO

L<Hello>

=head1 AUTHOR

kangyunchang,,,

=head1 LICENSE

This library is free software. You can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

1;
