#!/usr/bin/env bash

# msa
cd /public/home/d0202110815/at42/proj/iran_amuf/phylo/y

# tree
m_sa='ram.p.min239.fasta'
iqtree2 -m GTR+G+I -B 1000 -T 2 -s $m_sa --prefix 'run_iq/y_1000' > y.iqml.log

# kk
