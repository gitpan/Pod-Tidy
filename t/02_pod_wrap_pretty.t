#!/usr/bin/env perl

# Copyright (C) 2005  Joshua Hoblitt
#
# $Id: 02_pod_wrap_pretty.t,v 1.2 2005/10/03 01:15:56 jhoblitt Exp $

use strict;
use warnings FATAL => qw( all );

use lib qw( ./lib ./t );

use Test::More tests => 1;

use IO::String;
use Pod::Wrap::Pretty;
use Test::Pod::Tidy;

my $input = IO::String->new($MESSY_POD);
my $output = IO::String->new;

my $w = Pod::Wrap::Pretty->new;

$w->parse_from_filehandle($input, $output);

is(${$output->string_ref}, $TIDY_POD, "test line-breaking");
