#!/usr/bin/perl -w
use strict;
#my $cwd=`pwd`;
#chdir "/ai/home/dyuret/mor/2017/oflazer20171031";
my $word;
my %parses;
open(FP, 'lookup -f test-script.txt |') or die $!;
while(<FP>) {
    if (/^\s*$/) {
	next if not defined $word;
	my $line = join("\t", $word, keys(%parses));
	$line =~ s/Punc$/Punct/;
	$line =~ s/^(\pP+)\t\*UNKNOWN\*$/$1\t$1+Punct/;
	print "$line\n";
	undef $word;
	undef %parses;
    } elsif (/^</) {
	my ($a,$b) = split(/[\t\r\n]/);
	die unless $a eq $b;
	print "$a\n";
    } else {
	my @a = split(/[\t\r\n]/);
	my ($w, $p);
	if (scalar(@a) == 2) {
	    # warn "Two columns [$_]";
	    $w = $a[0];
	    $p = $a[1];
	} elsif (scalar(@a) == 3) {
	    # warn "Bad tag [$_]" unless $a[2] =~ /^\+/ || $a[2] eq '*UNKNOWN*';
	    $w = $a[0];
	    $p = $a[1] . $a[2];
	} else {
	    die "Bad line [$_]";
	}
	$word = $w if not defined $word;
	die "Bad word [$_]" if $w ne $word;
	$parses{$p} = 1;
    }
}
close(FP);
#chdir $cwd;
