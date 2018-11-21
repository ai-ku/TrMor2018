# Turkish morphology datasets

## TrMor2018

New Turkish morphology dataset based on mixed genre text used in the following
paper. Verified to have 97% inter-annotator agreement.

```
@article{DBLP:journals/corr/abs-1805-07946,
  author    = {Erenay Dayanik and
               Ekin Aky{\"{u}}rek and
               Deniz Yuret},
  title     = {MorphNet: {A} sequence-to-sequence model that combines morphological
               analysis and disambiguation},
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

## TrMor2016

Test set used in the following paper. Uses the same training set as TrMor2006. Approximately
20000 tokens from the training set were manually retagged to get a larger test
set. Unfortunately they did not exclude these tokens from the training set and they did not
provide any inter-annotator agreement.

```
@paper{AAAI1612370,
  author = {Eray Yildiz and Caglar Tirkaz and H. Sahin and Mustafa Eren and Omer Sonmez},
  title = {A Morphology-Aware Network for Morphological Disambiguation},
  conference = {AAAI Conference on Artificial Intelligence},
  year = {2016},
  url = {https://www.aaai.org/ocs/index.php/AAAI/AAAI16/paper/view/12370}
}
```

## TrMor2006

Turkish morphology dataset based on news text used in the following paper. The training set
was semi-automatically tagged and is not very accurate. The test set was hand-tagged but is
very small.

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

