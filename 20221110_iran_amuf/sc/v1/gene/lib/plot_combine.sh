#!/usr/bin/env bash

# cd
cd /home/atongsa/Documents/proj/process/20221110_iran_amuf/ana/gene/plot

# png
pdfjam --nup 2x2 --outfile ht.pdf \


# combine
pdfjam --nup 2x4 --outfile c.pdf \
     ld_decay.2.pdf \
    pixy.ssa.pdf ai.hapnet.1.pdf \
    ht.ai.png ht.pcdh9_exon.png \
    adipose.png diet.png
    ai.pcdh9.700k.n2.7in.pdf
 # 16,15; --scale 0.95; landscape











# kk
