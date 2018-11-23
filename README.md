# Turkish morphology datasets

## TrMor2018

New Turkish morphology dataset based on mixed genre text used in the following paper.

```
@article{DBLP:journals/corr/abs-1805-07946,
  author    = {Erenay Dayanik and Ekin Aky{\"{u}}rek and Deniz Yuret},
  title     = {MorphNet: {A} sequence-to-sequence model that combines morphological analysis and disambiguation},
  journal   = {CoRR},
  volume    = {abs/1805.07946},
  year      = {2018},
  url       = {http://arxiv.org/abs/1805.07946},
  archivePrefix = {arXiv},
  eprint    = {1805.07946},
  timestamp = {Mon, 13 Aug 2018 16:47:09 +0200},
  biburl    = {https://dblp.org/rec/bib/journals/corr/abs-1805-07946},
  bibsource = {dblp computer science bibliography, https://dblp.org}
}
```

To replicate the results in the paper please use v2.0.0 of this repo:
```
git clone https://github.com/ai-ku/TrMor2018.git
git checkout v2.0.0
```

`trmor2018.train` was semiautomatically annotated, randomly split (80-10-10%) five times and
the average scores were reported in the paper. `trmor2018.train` is verified to have 97%+
accuracy using `handtagged/trmor2018.gold`, a subset that was manually annotated by two
annotators with differences adjudicated by a third. The analyses were produced by a newer
version of Kemal Oflazer's finite state transducers circa 2018 for Turkish morphological
analysis, and [xfst](http://www.fsmbook.com) the Xerox Finite State software. Please use
both with permission.  Here are the data statistics:

|trmor2018	|train	|
|---------------|-------|
|Documents	|390	|
|Sentences	|34673	|
|Tokens 	|460669	|
|Unknown	|707	|


## TrMor2016

Test set used in the following paper which used the same training set as TrMor2006.
```
@paper{AAAI1612370,
  author = {Eray Yildiz and Caglar Tirkaz and H. Sahin and Mustafa Eren and Omer Sonmez},
  title = {A Morphology-Aware Network for Morphological Disambiguation},
  conference = {AAAI Conference on Artificial Intelligence},
  year = {2016},
  url = {https://www.aaai.org/ocs/index.php/AAAI/AAAI16/paper/view/12370}
}
```

To replicate the results in the paper please use v1.0.0 of this repo:
```
git clone https://github.com/ai-ku/TrMor2018.git
git checkout v1.0.0
```

Approximately 20000 tokens from the training set were manually retagged to obtain a larger
test set. Unfortunately the paper did not exclude these tokens from the training set and
they did not provide any inter-annotator agreement. The data format is the same as
trmor2006, here are the data statistics:

|trmor2016	|test	|
|---------------|-------|
|Documents	|42	|
|Sentences	|1286	|
|Tokens 	|19262	|
|Unambiguous	|9782	|
|Ambiguous	|9446	|
|Unknown	|34	|

## TrMor2006

Turkish morphology dataset based on news text used in the following paper. 
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

To replicate the results in the paper please use v1.0.0 of this repo:
```
git clone https://github.com/ai-ku/TrMor2018.git
git checkout v1.0.0
```

Each line lists a token or tag followed by one or more possible lemma+tag analyses separated
by whitespace. The first analysis is the correct one. Unknown tags are marked with the
substring `UNKNOWN`.  The analyses were produced by
[tr-tagger.tgz](http://deniz.yuret.com/turkish/tr-tagger.tgz), Kemal Oflazer's finite state
transducers circa 2006 for Turkish morphological analysis , and
[xfst](http://www.fsmbook.com) the Xerox Finite State software. Please use both with
permission. The training set was semi-automatically tagged and is not very accurate. The
test set was hand-tagged but is very small. Here are the data statistics:

|trmor2006	|train	|test	|
|---------------|-------|-------|
|Documents	|2383	|3	|
|Sentences	|50674	|42	|
|Tokens 	|837524	|862	|
|Unambiguous	|436406	|482	|
|Ambiguous	|399216	|379	|
|Unknown	|1902	|1	|
