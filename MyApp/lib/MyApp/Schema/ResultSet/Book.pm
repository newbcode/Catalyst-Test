#
#===============================================================================
#
#         FILE:  Book.pm
#
#  DESCRIPTION:  
#
#        FILES:  ---
#         BUGS:  ---
#        NOTES:  ---
#       AUTHOR:   (), <>
#      COMPANY:  
#      VERSION:  1.0
#      CREATED:  2013년 03월 05일 22시 55분 48초 KST
#     REVISION:  ---
#===============================================================================
package MyApp::Schema::ResultSet::Book;
use strict;
use warnings;

use base 'DBIx::Class::ResultSet';
 
=head2 created_after
 
A predefined search for recently added books
 
=cut
 
sub created_after {
    my ($self, $datetime) = @_;
 
    my $date_str = $self->result_source->schema->storage
                          ->datetime_parser->format_datetime($datetime);
 
    return $self->search({
        created => { '>' => $date_str }
    });
}

=head2 title_like
 
A predefined search for books with a 'LIKE' search in the string
 
=cut
 
sub title_like {
    my ($self, $title_str) = @_;
 
    return $self->search({
        title => { 'like' => "%$title_str%" }
    });
}

 
1;
