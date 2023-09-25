#!/usr/bin/perl
use strict;
use warnings;
use utf8;

my %mlex;
# open(my $fh, '<', 'mlex2perl.out');
# while(<$fh>) {
while(<DATA>) {
    my ($s, $r) = split;
    $r eq '0' or $r = qr/$r$/ui;	# use 0 to indicate optional match
    if (exists $mlex{$s}) {
	push @{$mlex{$s}}, $r;
    } else {
	$mlex{$s} = [$r];
    }
}

sub isoptional {
    my ($s) = @_;
    return ((not exists $mlex{$s}) || (grep { $_ eq '0' } @{$mlex{$s}}));
}

while(<>) {
    if (/^</) {
	print; next;
    }
    my ($w,$m) = split;
    $m eq "?" and $m = "$w+UNK";
    my @suffixes = ();
    for my $i (0..length($w)) {
	my ($wi, $mi) = (substr($w,$i,1), substr($m,$i,1));
	if (not @suffixes and substr($m,$i+1,1) eq "+") {
	    @suffixes = split(/(?=[+^])/, substr($m,$i+1));
	    push @suffixes, '+EOT';
	    $i > 0 and print(' ');
	    print("$wi¦$mi" . shift(@suffixes))
	} elsif ($i == length($w)) { # if we are out of characters, print the rest of the suffixes if any
	    # for my $s (@suffixes) {
	    # 	isoptional($s) or die("Did not match suffix [$s] in ".join(",",@suffixes));
	    # }
	    print(" EOT¦" . join('', @suffixes));
	} elsif (not @suffixes) {
	    $i > 0 and print(' ');
	    print("$wi¦$mi");
	} else {		# try to match the next suffix
	    my $match = -1;
	    for my $j (0..$#suffixes) {
		my $s = $suffixes[$j];
		next if not exists $mlex{$s};
		my $optional = 0;
		for my $re (@{$mlex{$s}}) {
		    if ($re == 0) {
			$optional = 1;
		    } elsif (substr($w, 0, $i+1) =~ $re) {
			$match = $j;
		    }
		}
		last if ($match >= 0 || !$optional);
	    }
	    if ($match >= 0) {
		print(" $wi¦" . join('', @suffixes[0..$match]));
		@suffixes = @suffixes[$match+1..$#suffixes];
	    } else {
		print(" $wi¦");
	    }
	}
    }
    print("\n");
}

# This section is the slightly edited version of the mlex2perl.pl output:

__DATA__
+A1pl	y?[ıiuü]z
+A1pl	[kğ]
+A1pl	l[ıiuü]m
+A1sg	y?[ıiuü]m
+A1sg	m
+A2pl	s[ıiuü]n[ıiuü]z
+A2pl	n[ıiuü]z
+A2pl	y?[ıiuü]n[ıiuü]z
+A2pl	y?[ıiuü]n
+A2pl	n[ıiuü]z[ae]
+A2sg	s[ıiuü]n
+A2sg	n
+A2sg	0
+A2sg	n[ae]
+A3pl	l[ae]r
+A3pl	s[ıiuü]nl[ae]r
+A3sg	0
+A3sg	s[ıiuü]n
+Abl	[dt][ae]n
+Able	y?[ae]bil
+Acc	y?[ıiuü]
+Acquire	l[ae]n
+ActOf	m[ae]c[ae]
+Adamantly	y?[ae]s[ıiuü]y[ae]
+Adj	0
+Adverb	0
+AfterDoingSo	y?[ıiuü]p
+Agt	[cç][ıiuü]
+Agt	y?[ıiuü]c[ıiuü]
+Almost	y?[ae]yaz
+Aor	[ae][ıiuü]r
+AorPart	[ae][ıiuü]r
+AsIf	[cç][ae]
+AsIf	[cç][ae]s[ıiuü]n[ae]
+AsLongAs	[dt][ıiuü]kç[ae]
+Become	l[ae]ş
+ByDoingSo	y?[ae]r[ae][kğ]
+Card	0
+Caus	[dt][ıiuü]rt
+Caus	[ıiuü]?r
+Caus	[ıiuü]?t
+Caus	[ae]r
+Caus	[ae]rt
+Cond	y?s[ae]
+Conj	0
+Continue	y?[ae]git
+Cop	[dt][ıiuü]r
+Dat	y?[ae]
+Demons	0
+Desr	s[ae]
+Det	0
+Dim	[cç][ıiuü][kğ]
+Dist	0
+Dup	0
+Equ	[cç][ae]
+EverSince	y?[ae]gel
+FeelLike	y?[ae]s[ıiuü]
+Fut	y?[ae]c[ae][kğ]
+FutPart	y?[ae]c[ae][kğ]
+Gen	n?[ıiuü]n
+Hastily	y?[ıiuü]ver
+Imp	0
+Imp	s[ae]
+InBetween	arası
+Inf1	m[ae][kğ]
+Inf2	m[ae]
+Inf3	y?[ıiuü]ş
+Ins	y?l[ae]
+Interj	0
+JustLike	[ıiuü]?ms[ıiuü]
+Loc	[dt][ae]
+Ly	[cç][ae]
+Narr	m[ıiuü]ş
+Narr	y?m[ıiuü]ş
+NarrPart	m[ıiuü]ş
+Neces	m[ae]l[ıiuü]
+Neg	m[ae]
+Ness	l[ıiuü][kğ]
+Nom	0
+NotAbleState	y?[ae]m[ae]zl[ıiuü][kğ]
+NotState	m[ae]zl[ıiuü][kğ]
+Noun	0
+Num	0
+Opt	y?[ae]
+Ord	0
+P1pl	[ıiuü]?m[ıiuü]z
+P1sg	[ıiuü]?m
+P2pl	[ıiuü]?n[ıiuü]z
+P2sg	[ıiuü]?n
+P3pl	l[ae]r[ıiuü]
+P3sg	s?[ıiuü]
+PCAbl	0
+PCAcc	0
+PCDat	0
+PCGen	0
+PCIns	0
+PCNom	0
+Pass	[ıiuü]?l
+Past	[dt][ıiuü]
+Past	y?[dt][ıiuü]
+PastPart	[dt][ıiuü][kğ]
+Pers	0
+Pnon	0
+Pos	0
+Postp	0
+Pres	0
+PresPart	y?[ae]n
+Prog1	[ıiuü]?yor
+Prog2	m[ae]kt[ae]
+Pron	0
+Prop	0
+Quant	0
+Ques	0
+Recip	[ıiuü]?ş
+Reflex	[ıiuü]?n
+Rel	ki
+Related	s[ae]l
+Repeat	y?[ae]dur
+Since	[dt][ıiuü]r
+SinceDoingSo	y?[ae]l[ıiuü]
+Start	y?[ae]koy
+Stay	y?[ae]kal
+Verb	0
+When	y?[ıiuü]nc[ae]
+While	y?ken
+With	l[ıiuü]
+Without	s[ıiuü]z
+WithoutBeingAbleToHaveDoneSo	y?[ae]m[ae]d[ae]n
+WithoutHavingDoneSo	m[ae]d[ae]n
+WithoutHavingDoneSo	m[ae]ks[ıiuü]z[ıiuü]n
+Zero	0
+A1sg	m
+Aor	[aeıiuü]r
+AorPart	[aeıiuü]r
+Pass	[ıiuü]?n
+Pass	[ıiuü]?n[ıiuü]l
