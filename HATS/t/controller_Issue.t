use strict;
use warnings;
use Test::More;


use Catalyst::Test 'HATS';
use HATS::Controller::Issue;

ok( request('/issue')->is_success, 'Request should succeed' );
done_testing();
