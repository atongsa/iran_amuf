#!/usr/bin/env bash

# cd
cd /public/home/d0202110815/at42/proj/iran_amuf/hap_net/mito/fa

# args
fa='sel.fa'
r_g='14159'

#14159..15298

# run
cytb_b='atgatcaacatc'
cytb_e='aacctcctaaaatgaaga'
seqkit locate --ignore-case -p $cytb_b $fa # 14154
seqkit locate --ignore-case -p $cytb_e $fa # 15293

# subseq
seqkit subseq -r 1:15293 $fa > no_dloop.921.fa

# trim
#snp-sites -c -o cytb_dloop.921.nogap.fa cytb_dloop.921.fa
#trimal -strictplus -in no_dloop.921.fa -out no_dloop.921.trim.fa
clipkit -m kpi no_dloop.921.fa -o no_dloop.921.kpi.fa
clipkit -m kpi sel.fa -o sel.kpi.fa









# kk
