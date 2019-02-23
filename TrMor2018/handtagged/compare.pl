#!/usr/bin/perl -w
use strict;

warn "Reading trmor2018.gold\n";
open(F1, "trmor2018.gold");
my %wgold;
my %tgold;
my ($nw, $ns, $nq);
my ($sid, $wid);
while(<F1>) {
    if (/^<S id="(.*?)">/) {
	$sid = $1;
	$wid = 0;
	$ns++;
    } elsif (/^<\/S>/) {
	undef $sid;
    } elsif (/^</) {
	warn $_;
    } else {
	$wid++;
	my $id = "$sid.$wid";
	my ($w,$t) = split;
	if ($t eq '?') {
	    $nq++;
	} else {
	    $nw++;
	    $wgold{$id} = $w;
	    $tgold{$id} = $t;
	}
    }
}
close(F1);
warn "Read $ns sentences, $nw words, $nq unknown.";

warn "Reading ../trmor2018.train";
open(F2, "../trmor2018.train");
my ($mt, $mf, $mq);
while(<F2>) {
    if (/^<S id="(.*?)">/) {
	$sid = $1;
	$wid = 0;
    } elsif (/^<\/S>/) {
	undef $sid;
    } elsif (/^</) {
	# warn $_;
    } else {
	$wid++;
	my $id = "$sid.$wid";
	next unless defined $wgold{$id};
	my ($w,$t) = split;
	die unless $w eq $wgold{$id};
	if ($t eq '?') {
	    $mq++;
	} elsif ($t eq $tgold{$id}) {
	    $mt++;
	} else {
	    $mf++;
	    print "$tgold{$id}\t$_";
	}
    }
}
close(F2);
warn "$mt correct, $mf incorrect, $mq unknown, @{[$mt+$mf+$mq]} total, @{[$mt/($mt+$mf)]} accuracy.\n"
