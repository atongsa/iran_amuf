#!/usr/bin/env bash

# cd
cd /public/home/d0202110815/at42/proj/iran_amuf/demo_graphy/chr_auto/admix_ture

# select_ssa_vcf
cd /public/home/d0202110815/at42/proj/iran_amuf/demo_graphy/chr_auto/admix_ture
run_admix_select_vcf.sh

# run_admix
run_admix_snmf.sh

# plot
cd /public/home/d0202110815/at42/proj/iran_amuf/demo_graphy/chr_auto/admix_ture/snmf

plot_ssa.snmf.sh


# kk
