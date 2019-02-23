* trmor2018.train: Semi-automatically generated morphology dataset randomly split and used
  in experiments of [https://arxiv.org/abs/1805.07946].

* handtagged: Manually annotated subset used to measure accuracy of trmor2018.train. Please
  do not use this file in experiments, it is only intended to measure the accuracy of
  trmor2018.train. More importantly **please do not copy any data between trmor2018.train
  and trmor2018.gold, do not use trmor2018.gold for training or testing models**, otherwise
  we will lose our ability to evaluate data quality on an independently tagged subset.
  
* analyzer: Scripts for Oflazer's morphological analyzer used to generate the morphological
  analyses. If you need the actual analyzer please ask for permission.
