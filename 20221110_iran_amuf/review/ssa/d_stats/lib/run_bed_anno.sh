#!/usr/bin/env bash

# cd
cd /public/home/d0202110815/at42/proj/iran_amuf/d_stats/s_dinves/d.inves_anno

# args
bed_p='/public/home/d0202110815/at42/proj/iran_amuf/d_stats/s_dinves/d.inves_filter'
gff_tsv='/public/home/d0202110815/at42/proj/convergency_sv/genome/vep/sheep/table/gff.gene.anno.tsv'

# run
for f in $bed_p/top5.*.tsv
do
f_a=`basename $f`
a_p=${f_a%.st.tsv}
bedtools intersect -a $f -b $gff_tsv -wo > $a_p.anno.tsv
done

# tsv_2_xlsx
for f in *.tsv
do
n=${f%.sig.anno.tsv}
n2=${n#top5.}
awk -vn_m=$n2 '{print n_m"\t"$0}' $f
done > fdm_top5.all.anno

# kk
