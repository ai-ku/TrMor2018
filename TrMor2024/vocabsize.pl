#!/usr/bin/perl -w
use strict;
use warnings;
use utf8;

my %left;
my %right;

while(<>) {
    next if /^</;
    my @s = split;
    for my $s (@s) {
	my ($l,$r) = split(/¦/, $s);
	if (not defined $r) {
	    $r = "";
	}
	$left{$l} = $right{$r} = 1;
    }
}

my $nleft = keys %left;
my $nright = keys %right;
print("$nleft\t$nright\n");
