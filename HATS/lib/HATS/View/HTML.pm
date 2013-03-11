package HATS::View::HTML;
use Moose;
use namespace::autoclean;

extends 'Catalyst::View::TT';

__PACKAGE__->config(
    TEMPLATE_EXTENSION => '.tt2',
);

=head1 NAME

HATS::View::HTML - TT View for HATS

=head1 DESCRIPTION

TT View for HATS.

=head1 SEE ALSO

L<HATS>

=head1 AUTHOR

kangyunchang,,,

=head1 LICENSE

This library is free software. You can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

1;
