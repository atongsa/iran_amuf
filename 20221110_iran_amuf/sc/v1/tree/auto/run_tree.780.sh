#!/usr/bin/env bash

# cd
cd /public/home/d0202110815/at42/proj/iran_amuf/phylo/auto/v_f

# args
b_f='/public/home/d0202110815/at42/proj/iran_amuf/chr_auto/pk_780/m_g/mg.780'

# dist
#plink --chr-set 26 --chr 1-26 --keep s2.id --bfile $b_f --distance square 1-ibs
plink --bfile $b_f \
    --chr-set 26 \
    --chr 1-26 \
    --distance square 1-ibs \
    --out dis.780

# kk
