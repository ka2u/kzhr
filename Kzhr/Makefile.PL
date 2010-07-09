use inc::Module::Install;
use Module::Install::ReadmeFromPod;
use Module::Install::AuthorTests;
use Module::Install::Repository

name 'Kzhr';
all_from 'lib/Kzhr.pm';
readme_from('lib/Kzhr.pm');

requires 'Log::Dispatch'       => '2.26';
requires 'Plack'               => '0.9940';
requires 'Pod::Usage'          => '1.38';
requires 'Router::Simple'      => '0.06';
requires 'Text::MicroTemplate' => '0.13';
build_requires 'Test::More';
test_requires 'Test::Requires';

tests 't/*.t t/*/*.t t/*/*/*.t t/*/*/*/*.t t/*/*/*/*/*.t';
author_tests 'xt';

auto_install;
auto_set_repository;
WriteAll;
