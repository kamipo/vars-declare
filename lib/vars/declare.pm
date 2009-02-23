package vars::declare;

use strict;
use warnings;
our $VERSION = '0.01';

use Filter::Simple;

FILTER {
    s/\s(var\s+.*);/ BEGIN {$1}/g;
};

sub import {
    my $caller = caller;

    no strict 'refs';
    *{"$caller\::var"} = \&var;
}

sub var {
    my $caller = caller;
    my ($name, $value) = @_; 

    return unless +($name || '') =~ m{^[a-zA-Z_]\w*$};

    no strict 'refs';
    *{"$caller\::$name"} = sub () : lvalue {$value};
}

1;
__END__

=head1 NAME

vars::declare -

=head1 SYNOPSIS

  use vars::declare;

=head1 DESCRIPTION

vars::declare is

=head1 AUTHOR

Ryuta Kamizono E<lt>kamipo@gmail.comE<gt>

=head1 SEE ALSO

=head1 LICENSE

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

=cut
