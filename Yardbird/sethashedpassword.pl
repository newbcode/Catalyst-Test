#!/usr/bin/perl 
#===============================================================================
#
#         FILE:  sethashedpassword.pl
#
#        USAGE:  ./sethashedpassword.pl 
#
#  DESCRIPTION:  
#
#      OPTIONS:  ---
# REQUIREMENTS:  ---
#         BUGS:  ---
#        NOTES:  ---
#       AUTHOR:   (), <>
#      COMPANY:  
#      VERSION:  1.0
#      CREATED:  2013년 03월 05일 18시 15분 39초 KST
#     REVISION:  ---
#===============================================================================

use strict;
use warnings;
use Yardbird::Schema;

# $ perl -Ilib set_hashed_passwords.pl 

my $schema = Yardbird::Schema->connect('dbi:mysql:yardbird', 'username', 'password');
my @users = $schema->resultset('User')->all;
foreach my $user (@users) {
    $user->password('password');
    $user->update;
}


