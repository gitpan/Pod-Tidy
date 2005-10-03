# Copyright (C) 2005  Joshua Hoblitt
#
# $Id: Pretty.pm,v 1.1.1.1 2005/09/17 20:13:19 jhoblitt Exp $

package Pod::Wrap::Pretty;

use strict;

use vars qw( $VERSION );
$VERSION = '0.01';

use base qw( Pod::Wrap );

BEGIN {
    use Text::Wrap;

    $Text::Wrap::columns    = 80;
    $Text::Wrap::tabstop    = 4;            # expand tabs to 4 spaces
    $Text::Wrap::unexpand   = undef;        # permanently expand/remove tabs
    $Text::Wrap::huge       = 'overflow';   # don't break long words, eg. URLs
}

sub textblock
{
    my ($self, $text) = @_;

    # is it a plain text paragraph?
    if ($text !~ /^=/mg) {
        # it is - remove all but the last newline so line the breaks are redone
        $text =~ s/\n(?!\Z)/ /g;
    }

    $self->SUPER::textblock($text, @_);
}

1;

__END__
