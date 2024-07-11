#!/usr/bin/env bash

# lib
mamba activate dsuite

# cd
cd /public/home/d0202110815/at42/proj/iran_amuf/d_stats

# vf
cd /public/home/d0202110815/at42/proj/iran_amuf/d_stats/v_f

# for f in {1..26}; do ls *.$f.*.gz; done | xargs -I{} echo '$vf_p/'{} |\
#  sed 's/$/ \\/' | sed '$ s/\\$//'

# sample
s_p='/public/home/d0202110815/at42/proj/iran_amuf/d_stats/stats_D/spe.strata'

# sc_args
cat men.tsv | while read p1; do
cat ssa.tsv | while read p2; do
cat o.o.tsv | while read p3; do
cat o.ca.tsv | while read p4; do
printf "%s\t%s\t%s\t%s\n"  $p1 $p2 $p3 $p4
done
done
done
done > d.trio.tsv

awk 'BEGIN{FS="\t"; OFS="\t"} NR==FNR{a[$1]=$0; next} ($1 in a){print a[$1]} !($1 in a){print $1,"xxx"}' spe.strata 810.id > dsuite.xxx.strata

cut -f2 spe.strata | uniq |\
tr '\n' ',' | sed '$ s/,$/\n/'
# (((MEN,(BAS,BGE,GAR,GUR,ITT,JLS,KAC,KAG,KAJ,KAR,KIL,MES,MRS,NES,PAS,SUM,THA,VEM)),(O.orientalis_1,O.orientalis_2)),Outgroup);

# cat d.trio.tsv | while read p1 p2 p3 p4; do
# echo $p1 $p2 $p3 $p4 | tr ' ' '\n' > tmp.trio
# awk 'BEGIN{FS="\t"; OFS="\t"} NR==FNR{a[$1]=$1; next} ($2 in a){print $0}' tmp.trio spe.strata > tmp.trio.strata
# awk 'BEGIN{FS="\t"; OFS="\t"} NR==FNR{a[$1]=$0; next} ($1 in a){print a[$1]} !($1 in a){print $1,"xxx"}' tmp.trio.strata 810.id > pop_f/$p2.$p3.strata
# cp pop_f/$p2.$p3.strata ../d_trio/dxxx.$p2.$p3.strata
# done

# cat d.trio.tsv | while read p1 p2 p3 p4; do
# printf "(((%s,%s),%s),%s);\n" $p1 $p2 $p3 $p4 > tree_f/$p2.$p3.nwk
# done

## arg_vf
seq 26 | xargs -I {} echo '$vf_p/'{}.ms01_mf001.vcf.gz' \' | sed '$ s/ \\$//'

## arg_folder/pop
cat d.trio.tsv | while read p1 p2 p3 p4;do
mkdir -p ../d_trio/$p2.$p3
cp ../arg_s/pop_f/$p2.$p3.strata ../d_trio/$p2.$p3/
done

# D
cd /public/home/d0202110815/at42/proj/iran_amuf/d_stats/s_dtrios

run_dtrios.sh

## combine_d/filter
Dsuite DtriosCombine dtrio.{1..26} -o dsuite.dtrio -t tree.all.nwk

cat d.trio.tsv | while read p1 p2 p3 p4;do
cat dsuite.dtrio_combined_BBAA.txt |\
grep $p1 | grep $p2 | grep $p3
done > dsuite.dtrio_36.txt

cat <(head -n 1 dsuite.dtrio_combined_BBAA.txt) dsuite.dtrio_36.txt > dsuite.ssa.tsv

# fd_m
cd /public/home/d0202110815/at42/proj/iran_amuf/d_stats/s_dinves/
run_dinvestigate.sh

## filter
for f in {GUR,BGE,SUM,GAR}
do
echo $f
cat MEN_${f}_O.orientalis_2_* > ../d.inves_filter/$f.tsv
done

cd /public/home/d0202110815/at42/proj/iran_amuf/d_stats/s_dinves/d.inves_filter
for f in *.tsv
do
grep -v 'chr' $f > $f.mat
awk '$4 > 0 && $6 > 0' $f.mat > $f.sig
top5.r $f.sig "X6"
sort -k1,1n -k2,2n top5.$f.sig > top5.${f%.tsv}.sig.st
rm $f.mat
rm $f.sig
rm top5.$f.sig
done

# overlap_sig
bedtools multiinter -header -i *st > ssa_4_fd_overlap.tsv
head -n 1 ssa_4_fd_overlap.tsv > head_overlap.name
tail -n +2 ssa_4_fd_overlap.tsv | awk '$4==4' > ssa_4_fd_overlap.4.tsv

# plot_rg_overlap
grep -v chr ssa_4_fd_overlap.tsv | awk -vOFS="\t" '{$2=$2-1}1' > ssa_4_fd_overlap.bed
bedtools makewindows -b ssa_4_fd_overlap.bed -w 1 > one.base.bed
bedtools intersect -wo -a one.base.bed -b ssa_4_fd_overlap.bed |\
 cut -f1-2,9-12 > onbe.base.venn.bed

# anno
run_bed_anno.sh

# kk
