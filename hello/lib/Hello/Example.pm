package Hello::Example;
use strict;
use warnings;
use base "Kzhr::Controller";

sub say {
    my ($class, $app) = @_;
    $app->context->res->redirect("http://google.co.jp");
    return "say hello.";
}
1;
