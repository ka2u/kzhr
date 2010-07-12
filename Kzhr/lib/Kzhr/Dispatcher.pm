package Kzhr::Dispatcher;

use strict;
use warnings;
use base "Router::Simple";
use UNIVERSAL::require;

sub dispatch {
    my ($self, $app) = @_;

    if (my $p = $self->match($app->context->req->env)) {
        my $class = ref $app;
        my $action = $p->{action};
        my $controller = "${class}::$p->{controller}";
        #TODO require
        $controller->require;
        $controller->$action($app);
    }
    else {
        # 404
        warn "404";
    }
}


1;
__END__

=encoding utf-8

=for stopwords

=head1 NAME

Kzhr -

=head1 SYNOPSIS

  use Kzhr;

=head1 DESCRIPTION

Kzhr is

=head1 AUTHOR

Kazuhiro Shibuya E<lt>stevenlabs@gmail.comE<gt>

=head1 COPYRIGHT

Copyright 2010- Kazuhiro Shibuya

=head1 LICENSE

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

=head1 SEE ALSO

=cut
