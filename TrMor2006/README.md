Turkish morphology dataset based on news text used in the following paper (HLT06):

```
@InProceedings{yuret-ture:2006:HLT-NAACL06-Main,
  author    = {Yuret, Deniz  and  Ture, Ferhan},
  title     = {Learning Morphological Disambiguation Rules for Turkish},
  booktitle = {Proceedings of the Human Language Technology Conference of the NAACL, Main Conference},
  month     = {June},
  year      = {2006},
  address   = {New York City, USA},
  publisher = {Association for Computational Linguistics},
  pages     = {328--334},
  url       = {http://www.aclweb.org/anthology/N/N06/N06-1042}
}
```

File history:

The original train and test data from Kemal Oflazer were:

```
$ ls -l
-r--r--r--. 1 dyuret ai  5318190 Dec  1  2005 correctparses_03.txt.gz
-r--r--r--. 1 dyuret ai     5819 Dec  2  2005 test.1.2.dis.gz
$ md5sum *
01e8a323f6d696eb8953ca7ba5f8b136  correctparses_03.txt.gz
050045226aa798d1a45c3e643ebebb99  test.1.2.dis.gz
```

These are available at [http://www.denizyuret.com/2006/11/turkish-resources.html].  The
train data was semi-automatically tagged with relatively low accuracy, the test data was
hand-tagged but small. To test the disambiguator in [HLT06] we generated all alternative
tags using Xerox Finite State Tool (XFST) and Oflazer's FST circa Dec 2005:

```
$ ls -l
-r-xr-xr-x. 1 dyuret ai   405040 Dec  1  2005 lookup
-r--r--r--. 1 dyuret ai      121 Dec  1  2005 script.txt
-r--r--r--. 1 dyuret ai  3991251 Dec  1  2005 tfeatures.fst
-r--r--r--. 1 dyuret ai  1853037 Dec  1  2005 turknum.fst
-r--r--r--. 1 dyuret ai   343090 Dec  1  2005 turkunk.fst
-r--r--r--. 1 dyuret ai      151 Dec  1  2005 unknown.fst
$ md5sum *
00465ed8dbea44bb2948c35427cfa23e  lookup
2fd99ce396737d5fb68c2a6cab52cda5  script.txt
7049b5fe1dcc2267c8c4d12dccd43fc6  tfeatures.fst
3af72e0f56a5ece7238b303b8539ae3a  turknum.fst
a79ecaeb3c9aaed05e119501e4721572  turkunk.fst
297421ca76738c3c69d71fb10ece2b98  unknown.fst
```

The generated tags were placed on a single line for each word with the first tag following
the word being the correct one:

```
$ ls -l
-rw-rw-r--. 1 dyuret ai     8574 Dec  2  2005 test.merge.gz
-rw-rw-r--. 1 dyuret ai  8236812 Dec  1  2005 train.merge.gz
$ md5sum *
7b3b43444dc92be559fc023e13fb0655  test.merge.gz
5e239002959a43e0e0c702bbad36ab27  train.merge.gz
```

These "merge" files were used to generate the results in [HLT06]. For this repo we only
converted the encoding from ISO-8859-9 to UTF-8 and space separated lines to tab separated
lines:

```
$ zcat test.merge.gz | iconv -f ISO-8859-9 -t UTF-8 | perl -pe 's/ /\t/g' > trmor2006.test
$ zcat train.merge.gz | iconv -f ISO-8859-9 -t UTF-8 | perl -pe 's/ /\t/g' > trmor2006.train
$ ls -l
-rw-r--r--. 1 dyuret ai    53445 Feb 22 14:56 trmor2006.test
-rw-r--r--. 1 dyuret ai 50457891 Feb 22 14:58 trmor2006.train
$ md5sum *
8da4649d6c35a24bd8711ed058e101bc  trmor2006.test
f9e71bb5d0a3d1dde9b3bfc89a80a1ad  trmor2006.train
```
