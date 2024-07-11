#!/usr/bin/env bash

# cd
cd /public/home/d0202110815/at42/proj/iran_amuf/cytb/tree

# ml_tree
m_sa='../fa/Haplotype.fas'
iqtree2 -m GTR+G+I -B 1000 -T 2 -s $m_sa --prefix 'ml/cytb_hap'

# kk
