#!/usr/bin/env bash

# cd
cd /public/home/d0202110815/at42/proj/iran_amuf/review/dfoil/count/stat

# 
d_f='/public/home/d0202110815/at42/proj/iran_amuf/review/dfoil/dfoil/dfoil.py'

a=`ls ../ct_nm/r_g13/*.count | xargs -I{} echo --infile {} |\
tr '\n' ' '`

$d_f --out sel.49.rg.13.stat $a

$d_f --plot_totals --plot sel.49.rg.13.pdf --out sel.49.rg.13.stat $a

# kk