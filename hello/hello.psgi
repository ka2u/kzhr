use MyApp;
use Plack::Builder

builder {
    enable 'Plack::Middleware::Static',
        path => qr{^/(js|css|images)/},
        root => './static';
    MyApp->run();
};

