#!/usr/bin/env Rscript
#SBATCH -J nj.tree #sm_sp.at42_id_1.at42_id_2
#SBATCH -p Cnode # Fnode2/Fnode1/Gnode/Cnode; kdy:xhacnormala
#SBATCH -N 1
#SBATCH -n 1
#SBATCH --mem=40G
#SBATCH -t 4-00:00
#SBATCH -o %j.o
#SBATCH -e %j.e

# lib
library(tidytree)
library(treeio)
library(ape)

# cd
setwd('/public/home/d0202110815/at42/proj/iran_amuf/phylo/mito/tree/nj')

# args
fa_f='sel.trim.fa'
nj_tree='mt.768.bionj'

# nj
fa <- read.dna(fa_f, format='fasta')
d <- dist.dna(fa)

tr <- bionj(d)
bp <- boot.phylo(tr, fa, function(x) bionj(dist.dna(x)), B=100, trees=T)

#con <- consensus(bp$trees, p=0.5)

write.tree(bp$trees, 'mt.nj.100.tree')

# kk
