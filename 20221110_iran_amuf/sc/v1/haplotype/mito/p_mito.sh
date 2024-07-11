#!/usr/bin/env bash

# tree
cd /public/home/d0202110815/at42/proj/iran_amuf/phylo/mito/tree

plot_tree.mito.ssa.sh

# cytb; NC_001941:14159..15298; 1140
cd /public/home/d0202110815/at42/proj/iran_amuf/chr_mito/cytb

seqkit locate -i -d -p ATGATCAACATCCGA o.all.msa.fa > start.id
seqkit locate -i -d -p ACAACCTCCTAAAATGAAGA o.all.msa.fa > end.id

seqkit subseq -r 15683:16822 o.all.msa.fa > cytb.fa

seqkit grep -n -f oo.id cytb.fa > oo.cytb.fa

# no_control
f_a='sel.fa'
p_t='aatcattatcaacg' # begin of control region
seqkit locate -i -d -p $p_t $f_a
seqkit subseq -r 1:15432 sel.fa > sel.noct.fa

# phylo
ete3 view -t oo.cytb.1140bp.fa.treefile -i tree.pdf

# plot_hapnet
plot_hapnet.mito.v1.r

# kk
