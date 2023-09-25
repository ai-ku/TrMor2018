#!/usr/bin/env perl

my $firstword = 1;
while(<>) {
    my $a = (split)[0];
    if (m:^</S>:) {
	print("\n");
	$firstword = 1
    } elsif (m:^<:) {
	
    } elsif ($firstword || $a =~ /^[.,:;?!)]/) {
	print($a);
	$firstword = 0;
    } else {
	print(" $a");
    }
}

	    
