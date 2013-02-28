use strict;
use warnings;
use Test::More;


use Catalyst::Test 'Hello';
use Hello::Controller::top;

ok( request('/top')->is_success, 'Request should succeed' );
done_testing();
