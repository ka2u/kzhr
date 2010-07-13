package Kzhr;

use strict;
use warnings;
our $VERSION = '0.01';
use Kzhr::Context;
use Kzhr::Dispatcher;
use Kzhr::Logger;
use Kzhr::Request;
use Kzhr::Response;
use Data::Dumper;

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
    return sub { $self->process(shift) };
}

sub process {
    my ($self, $env) = @_;

    my $req = Kzhr::Request->new($env);
    my $res = Kzhr::Response->new;
    my $log = Kzhr::Logger->new;
    $self->set_context(Kzhr::Context->new($req, $res, $log));
    $self->init;

    my @response = $self->{dispatcher}->dispatch($self);
    $self->context->res->renew(@response) unless $self->context->res->location;

    return $self->context->res->finalize;
}

# This will run once at startup
sub startup {}
# This will run for each request
sub init {}


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
