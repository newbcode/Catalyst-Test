use strict;
use warnings;
use Test::More;


use Catalyst::Test 'Hello';
use Hello::Controller::Top;

ok( request('/top')->is_success, 'Request should succeed' );
done_testing();
