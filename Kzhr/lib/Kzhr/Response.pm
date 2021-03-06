package Kzhr::Response;

use strict;
use warnings;
use base "Plack::Response";

sub renew {
    my ($self, $status, $headers, $body) = @_;
    $self->status($status);
    $self->headers($headers);
    $self->body($body);
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
