package Kzhr::Context;

use strict;
use warnings;
use Kzhr::Request;
use Kzhr::Response;

sub new {
    my ($class, $req, $res, $log) = @_;

    bless {
        request  => $req,
        response => $res,
        log      => $log,
    }, $class;
}

sub req {
    return $_[0]->{request};
}

sub res {
    return $_[0]->{response};
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
