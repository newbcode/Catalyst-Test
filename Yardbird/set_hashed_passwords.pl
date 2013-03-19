#!/usr/bin/perl
use strict;
use warnings;
use Yardbird::Schema;

# $ perl -Ilib set_hashed_passwords.pl 

my $schema = Yardbird::Schema->connect('dbi:mysql:yardbird', 'root', 'sado999');
my @users = $schema->resultset('User')->all;
foreach my $user (@users) {
    $user->password('password');
    $user->update;
}
