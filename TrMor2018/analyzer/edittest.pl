#!/usr/bin/perl -w
use strict;
my ($lookup,$edited) = @ARGV;
open(F1,$lookup);
open(F2,$edited);

while(<F1>) {
    my $look = $_;
    my $merg = <F2>;
    if ($look =~ /^</) {
	$look eq $merg || warn "line:$.\nlook:${look}merg:$merg\n";
    } else {
	my ($lw,@lt) = split(' ', $look);
	my ($mw,@mt) = split(' ', $merg);
	$lw eq $mw || warn "line:$.\nlook:${look}merg:$merg\n";
	if ($mt[0] eq '?') { shift(@mt); }
	if (scalar(@mt) != scalar(@lt)) {
	    warn "line:$.\nlook:${look}merg:$merg\n";
	} else {
	    my @mt = sort @mt;
	    my @lt = sort @lt;
	    for (my $i = 0; $i <= $#mt; $i++) {
		$mt[$i] eq $lt[$i] || warn "line:$.\nlook:${look}merg:$merg\n";
	    }
	}
    }
}

close(F1);
close(F2);
