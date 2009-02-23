use inc::Module::Install;
name 'vars-declare';
all_from 'lib/vars/declare.pm';

requires 'Filter::Simple';

tests 't/*.t';
author_tests 'xt';

build_requires 'Test::More';
use_test_base;
auto_include;
WriteAll;
