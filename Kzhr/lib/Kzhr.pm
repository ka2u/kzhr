package Kzhr;

use strict;
use warnings;
our $VERSION = '0.01';
use Kzhr::Context;
use Kzhr::Dispatcher;
use Kzhr::Request;
use Kzhr::Response;

{
    our $context;
    sub context { $context }
    sub set_context { $context = $_[1] }
}

sub new {
    my $class = shift;
    my $dispatcher = Kzhr::Dispatcher->new;
    return bless { dispatcher => $dispatcher }, $class;
}

sub run {
    my $class = shift;
    my $self = $class->new;
    $self->startup;
    return sub { $self->build(shift) };
}

sub build {
    my ($self, $env) = @_;

    my $req = Kzhr::Request->new($env);
    my $res = Kzhr::Response->new;
    $self->set_context(Kzhr::Context->new($req, $res));

    $self->{dispatcher}->dispatch($self);

    #TODO response
    $self->context->res->status(200);
    $self->context->res->content_type('text/html');
    $self->context->res->body('hello');
    return $self->context->res->finalize;
}

sub startup {}


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
