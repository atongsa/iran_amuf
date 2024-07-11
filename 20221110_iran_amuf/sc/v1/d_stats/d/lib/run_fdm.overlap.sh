#!/usr/bin/env bash

# cd
cd /public/home/d0202110815/at42/proj/iran_amuf/d_stats/s_dinves/d.inves_filter/ssa_4

# run
awk '$4==4 && $1==10' ssa_4_fd_overlap.tsv | bedtools merge








# kk
