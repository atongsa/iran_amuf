#!/usr/bin/env bash

# cd
cd /public/home/d0202110815/at42/proj/iran_amuf/chr_mito/mito_fa

# sel
i_d='sel.id'
f_a='o.all.msa.trim.fa'
seqkit grep -f $i_d $f_a > sel.fa

i_d='ref.id'
f_a='o.all.msa.trim.fa'
seqkit grep -f $i_d $f_a > ref.fa

# anno
cat sel.id | while read i_d
do
sed "s/>Feature.*/>Feature $i_d/" anno.ref.txt
echo
done > anno.sel.tbl

# put_ncbi
https://www.ncbi.nlm.nih.gov/WebSub/
BankIt
2714507
gb-admin@ncbi.nlm.nih.gov

OR160429-OR161034

All raw sequencing reads in this study were deposited in NCBI’s SRA under the accession number OR160429-OR161034.

## cytb
14154
15290

# kk
