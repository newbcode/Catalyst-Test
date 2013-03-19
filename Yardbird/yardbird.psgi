use strict;
use warnings;

use Yardbird;

my $app = Yardbird->apply_default_middlewares(Yardbird->psgi_app);
$app;

