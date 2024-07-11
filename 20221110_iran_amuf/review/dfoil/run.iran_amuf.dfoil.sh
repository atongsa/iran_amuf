#!/usr/bin/env bash

# cd
cd /public/home/d0202110815/at42/proj/iran_amuf/review/dfoil

# filter_vf
run.iran_amuf.filter_bed.sh

# vf2count
cd /public/home/d0202110815/at42/proj/iran_amuf/review/dfoil/count

#args
mf_tool='/public/home/d0202110815/at42/proj/iran_amuf/review/dfoil/mvftools/mvftools/mvftools.py'

v_f='../v_f/sel49.fl1.rg.vcf.gz'

l_b='/public/home/d0202110815/at42/proj/iran_amuf/review/dfoil/s_p/sel.label2'

lb_d5='/public/home/d0202110815/at42/proj/iran_amuf/review/dfoil/s_p/og/d5_4.label2'

#vf2count
$mf_tool ConvertVCF2MVF --vcf $v_f --out sel.49.rg.mvf

cat $lb_d5 | while read n_m l_b
do
$mf_tool CalcPatternCount \
    --mvf ../sel.49.mvf --out sel.49.$n_m.count \
    --sample-labels $l_b
done

# python3 fasta2dfoil.py ip.fa \
#     --out ot.fa \
#     --names TAXA1,TAXA2,TAXA3,TAXA4,TAXA5

# d_stat
d_f='/public/home/d0202110815/at42/proj/iran_amuf/review/dfoil/dfoil/dfoil.py'

$d_f --infile ../ct_nm/sel.49.80.count --out sel.49.80.stat --plot sel.49.80.pdf

# summary
d_a='/public/home/d0202110815/at42/proj/iran_amuf/review/dfoil/dfoil/dfoil_analyze.py'

$d_a sel.49.rg.13.stat > sel.49.rg.13.sum

# kk
