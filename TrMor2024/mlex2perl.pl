#!/usr/bin/perl
use strict;
use warnings;
use utf8;

# Read trmor/mlex.xfst from stdin, output a list of regex for each suffix

sub xfst2perl {
    my ($xfst) = @_;
    $xfst =~ s/\[\s*(.+?)\s*\]/$1/;
    my @xfst = split(" ", $xfst);
    my $re = "";
    for my $i (0..$#xfst) {
	my $x = $xfst[$i];
	if ($x eq "%+") {

	} elsif ($x eq "=A") {
	    $re .= "[ae]";
	} elsif ($x eq "=I") {
	    if ($xfst[$i-1] eq "%+") {
		$re .= "[ıiuü]?";
	    } else {
		$re .= "[ıiuü]";
	    }
	} elsif ($x eq "=D") {
	    $re .= "[dt]";
	} elsif ($x eq "=C") {
	    $re .= "[cç]";
	} elsif ($x eq "=N") {
	    $re .= "n?";
	} elsif ($x eq "=S") {
	    $re .= "s?";
	} elsif ($x eq "=Y") {
	    $re .= "y?";
	} elsif ($x eq "k" and $i == $#xfst) {
	    $re .= "[kğ]";
	} elsif ($x =~ /^\p{Ll}$/) {
	    $re .= $x;
	} else {
	    die "Unrecognized token: [$x] in [$xfst]";
	}
    }
    return $re;
}

while(<>) {
    if (/^\s*"(\+\w+?)"\s*->\s*(0|\[[^]]+\]),/) {
	my $re = $2;
	if ($re ne '0') {
	    $re = xfst2perl($re);
	}
	my $key = $1;
	if ($key =~ /\d$/ and $key !~ /^\+(Prog|Inf)/) {
	    chop($key);
	}
	print("$key\t$re\n");
    } elsif (/^\s*"(\+\w+?)\d?"\s*->\s*0,/) {
	print("$1\t0\n");
    }
}


# Manually handle exceptions below:

while(<DATA>) {
    my ($a,$b) = split;
    print("$a\t$b\n");
}

# +P3sg	0	!! Yilbasindan
# +Neg	0	!! degil
# +Reflex	0	!! kendisi
# +Gen	0	!! senin
# +A1sg	0	!! ben

__DATA__
+Aor	[aeıiuü]r
+AorPart	[aeıiuü]r
+Pass	[ıiuü]?n
+Pass	[ıiuü]?n[ıiuü]l
