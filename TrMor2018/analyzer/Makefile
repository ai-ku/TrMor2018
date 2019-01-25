all:

foo.train.merge:
	cut -f1 ../trmor2018.train | lookup.pl > foo.train
	perl merge.pl ../trmor2018.train foo.train > foo.train.merge

foo.gold.merge:
	cut -f1 ../handtagged/trmor2018.gold | lookup.pl > foo.gold
	perl merge.pl ../handtagged/trmor2018.gold foo.gold > foo.gold.merge
