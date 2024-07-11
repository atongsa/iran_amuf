#!/usr/bin/env bash

# cd
cd /public/home/d0202110815/at42/proj/iran_amuf/fst_pi/auto

# args
v_f='../v_f/auto.vcf.gz'
pop1='O.aries.tsv'
pop2='O.orientalis_1.tsv'
pop3='O.orientalis_2.tsv'

# run
for pop in {$pop1,$pop2,$pop3}
do
vcftools --gzvcf $v_f \
    --keep $pop \
    --window-pi 2000000 \
    --window-pi-step 1000000 \
    --out pi.auto.$pop
done

# fst
v_f='auto.chr4.sel.vcf'

at_func(){
cat para.txt | while read p1 p2
do
shuf -n 738 auto.id > pop1
shuf -n 25 auto.id > pop2
shuf -n 27 auto.id > pop3
vcftools --gzvcf $v_f \
    --weir-fst-pop $p1 --weir-fst-pop $p2 \
    --fst-window-size 20000000 \
    --fst-window-step 10000000 \
    --out fst.auto.$p1.$p2
fst_w=`grep 'weighted Fst estimate' fst.auto.$p1.$p2.log | cut -f2 -d':' | cut -f2 -d' '`
echo $p1 $p2 $fst_w
rm fst.auto.$p1.$p2*
done
}

for i in {1..1000}
do
	at_func
done > fst.boot.txt

#parallel -j 6 at_func > t

#sort -k1,1V -k2,2V fst.boot.txt | group 
awk '$1=="pop1" && $2=="pop2"' fst.boot.txt | sort -k3,3nr | head > v1.txt
awk '$1=="pop1" && $2=="pop3"' fst.boot.txt | sort -k3,3nr | head > v2.txt
awk '$1=="pop2" && $2=="pop3"' fst.boot.txt | sort -k3,3nr | head > v3.txt

# kk