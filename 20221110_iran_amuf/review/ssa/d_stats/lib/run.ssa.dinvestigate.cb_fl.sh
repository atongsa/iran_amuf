#!/usr/bin/env bash

# cd
cd /public/home/d0202110815/at42/proj/iran_amuf/review/ssa/d_fd/d_inves/c_b

# ssa4
ls ../cal/ | grep s_2_ | grep -E 'NES|SUM|GUR|BGE' | xargs -I {} cp ../cal/{} .

# filter_top5; filter
for f in {GUR,BGE,SUM,NES}
do
echo $f
cat MEN_${f}_O.orientalis_2_* > $f.tsv
done

for f in *.tsv
do
grep -v 'chr' $f > $f.mat
awk '$4 > 0 && $6 > 0' $f.mat > $f.sig
top5.r $f.sig "X6"
sort -k1,1n -k2,2n top5.$f.sig > top5.${f%.tsv}.st.sig
rm $f.mat
rm $f.sig
rm top5.$f.sig
done

# ggvenn
grep -v chr ssa_4_fd_overlap.tsv |\
    awk 'BEGIN{FS="\t"; OFS="\t"} {$3=$3+1; print $0}' > ssa_4_fd_overlap.bed
bedtools makewindows -b ssa_4_fd_overlap.bed -w 1 > one.base.bed
bedtools intersect -wo -a one.base.bed -b ssa_4_fd_overlap.bed |\
cut -f1-2,9-12 > one.base.venn.bed

# over_lap
for f in *sig
do 
cut -f1-3 $f | awk -vOFS="\t" '$3=$3+1' > $f.bed
done

bedtools multiinter -header -i *bed | awk '$4==4' > ssa.4.tsv

awk '{a=$3-$2; sum+=a} END{print sum}' ssa.4.tsv
# 6,226,033

# kk