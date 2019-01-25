#!/usr/bin/perl -w
use strict;
use Data::Dumper;

my ($gold, $tags) = @ARGV;
open(FP1,$gold) || die $!;
open(FP2,$tags) || die $!;

while (<FP1>) {
    my $line1 = $_;
    my $line2 = <FP2>;
    
    if ($line1 =~ /^</) {
	if ($line1 ne $line2) {
	    die "line1=[$line1]\nline2=[$line2]\n";
	}
	print $line1;
    } else {
	my @tok1 = split(' ', $line1);
	my @tok2 = split(' ', $line2);
	if ($tok1[0] ne $tok2[0]) {
	    die "line1=[$line1]\nline2=[$line2]\n";
	}
	if (scalar(@tok1) != 2) {
	    die "line1=[$line1]\n";
	}
	print "$tok1[0]\t$tok1[1]";
	my $found = 0;
	for (my $i = 1; $i <= $#tok2; $i++) {
	    if ($tok2[$i] eq $tok1[1]) {
		$found = 1;
	    } else {
		print "\t$tok2[$i]";
	    }
	}
	if ($found) {
	    print "\n";
	} else {
	    print "\tNOTFOUND\n";
	}
    }
}

close(FP2);
close(FP1);
