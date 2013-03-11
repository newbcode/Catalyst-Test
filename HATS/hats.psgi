use strict;
use warnings;

use HATS;

my $app = HATS->apply_default_middlewares(HATS->psgi_app);
$app;

