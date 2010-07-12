package Hello;
use strict;
use warnings;
use base "Kzhr";

sub startup {
    my $self = shift;
    warn "startup";
    $self->{dispatcher}->connect('/', {controller => 'Example', action => 'say'});
}
1;
