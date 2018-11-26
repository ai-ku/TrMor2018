Usage: cut -f1 ../trmor2018.train | lookup.pl > lookup.out

The lookup.pl script needs the following files from [xfst](http://www.fsmbook.com) and
[Kemal Oflazer](https://www.andrew.cmu.edu/user/ko):

```
-rw-r--r--. 1 dyuret ai      171 Nov 26 18:51 basic-script.txt
-rwxr-xr-x. 1 dyuret ai   958832 Nov 26 18:50 lookup
-rwxr-xr-x. 1 dyuret ai  4135387 Nov 26 18:51 plain_data.out
-rwxr-xr-x. 1 dyuret ai      276 Nov 26 18:51 test-script.txt
-rw-r--r--. 1 dyuret ai 42157029 Nov 26 18:51 tfeaturesulx.fst
-rw-r--r--. 1 dyuret ai 98137731 Nov 26 18:51 tfeaturesulx-len.fst
-rw-r--r--. 1 dyuret ai  1316447 Nov 26 18:51 tguesser-1.fst
-rw-r--r--. 1 dyuret ai     6598 Nov 26 18:51 tguesser-2.fst
-rw-r--r--. 1 dyuret ai   224116 Nov 26 18:51 tnumbers-utf8-1.fst
-rw-r--r--. 1 dyuret ai  2214095 Nov 26 18:51 tnumbers-utf8-2.fst
-rw-r--r--. 1 dyuret ai      993 Nov 26 18:51 tpunct.fst
-rw-r--r--. 1 dyuret ai   109865 Nov 26 18:51 uniq-unknown-words.txt
-rw-r--r--. 1 dyuret ai      151 Nov 26 18:51 unknown.fst
```

Sample input and output:

```
[dyuret@balina analyzer]$ cut -f1 ../trmor2018.train | head
<DATA>
<CORPUS id="0" path="Test">
<DOC id="0.1" path="Test/Test1.txt">
<S id="0.1.1">
Hazine
Merkez'i
rahatlattı
</S>
<S id="0.1.2">
Geçen
```

```
[dyuret@balina analyzer]$ cut -f1 ../trmor2018.train | lookup.pl | head
<DATA>
<CORPUS id="0" path="Test">
<DOC id="0.1" path="Test/Test1.txt">
<S id="0.1.1">
Hazine hazin+Adj^DB+Noun+Zero+A3sg+Pnon+Dat hazine+Noun+A3sg+Pnon+Nom Hazine+Noun+Prop+A3sg+Pnon+Nom
Merkez'i Merkez+Noun+A3sg+Pnon+Prop+Acc
rahatlattı rahatla+Verb^DB+Verb+Caus+Pos+Past+A3sg
</S>
<S id="0.1.2">
Geçen geç+Verb+Pos^DB+Adj+PresPart geçe+Postp+PCNom^DB+Noun+Zero+A3sg+P2sg+Nom Geçen+Noun+Prop+A3sg+Pnon+Nom geçen+Adj
```

