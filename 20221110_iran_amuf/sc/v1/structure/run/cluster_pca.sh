#!/usr/bin/env bash

# cd
cd /public/home/d0202110815/at42/proj/iran_sheep/structure/kmean

# args
b_p='iran_sheep.pr'
p_op='iran_sheep.amuf.fam.ind.id'
op_p='iran_sheep.amuf'

# run
plink --bfile $b_p \
    --keep $p_op \
    --allow-extra-chr \
    --chr-set 26 \
    --pca \
    --out $op_p

# kk
