#!/usr/bin/env bash

# cd
cd /public/home/d0202110815/at42/proj/iran_amuf/review/ssa/admixture/plot

# select_ssa_vcf
run.ssa.select_vcf.sh

# run_admix
run.ssa.snmf.sh

# plot
plot.ssa.snmf.m5.r

# kk
