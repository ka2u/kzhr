use lib "../Kzhr/lib";
use lib "./lib";
use Hello;
use Plack::Builder;

builder {
    enable 'Plack::Middleware::Static',
        path => qr{^/(js|css|images)/},
        root => './static';
    Hello->run();
};

