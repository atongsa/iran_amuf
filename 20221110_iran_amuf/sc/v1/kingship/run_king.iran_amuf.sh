#!/usr/bin/env bash

# cd
cd /public/home/d0202110815/at42/proj/iran_amuf/king

# select_amuf
b_f='iran_sheep.pr'
plink --chr-set 26 \
    --bfile $b_f --keep amuf.pk.id \
    --maf 0.01 --geno 0.05 \
    --set-missing-var-ids @_# \
    --make-bed --out pk.amuf

# run
# plink2 --bfile amuf.chr4 --king-cutoff 0 --out pk.kin.amuf
# # KR.15,SH.20; .0884

# king -b pk.amuf.bed --related --degree 2 --noscreen --prefix king.kin.amuf
# # no relative # --degree 2

king -b pk.amuf.bed --kinship --prefix king.kin.amuf32
# 273	273	KR.15	KR.15	1258893	0.2721	0.0001	0.4884
# SH.7	SH.7	SH.20	SH.20	1258642	0.1604	0.0012	0.2511

# kk