all:

mlex2perl.out: mlex2perl.pl mlex.xfst
	$^ > $@

trmor2018.align: align.pl trmor2018.train mlex2perl.out
	align.pl trmor2018.train > $@
