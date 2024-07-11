#!/usr/bin/env Rscript
#SBATCH -J mito.fst #sm_sp.at42_id_1.at42_id_2
#SBATCH -p Gnode # Fnode2/Fnode1/Gnode/Cnode; kdy:xhacnormala
#SBATCH -N 1
#SBATCH -n 2
#SBATCH --mem 60G
#SBATCH -t 4-00:00
#SBATCH -o j.at42_id.o
#SBATCH -e j.at42_id.e

```
seqkit grep -f mt.fst.id -n sel.st.fa > mt.sel.fa
```

# cd
setwd("/public/home/d0202110815/at42/proj/iran_amuf/fst_pi/mito")

# lib
library(gaston)
library(hierfstat)
library(ggpubr)
library(vcfR)
library(adegenet)
library(tidyverse)
library(Matrix)
library(radiator)
library(pegas)

# args
fa_f <- 'mt.st.fa'
pop <- 'mt.fst.strata'

# clean
## read
fa <- read.dna(fa_f, format='fasta')
df_2 <- DNAbin2genind(fa)

s_p <- read_tsv(pop, col_names=F)

## pop_read
fa_oa <- read.dna("g_p/oa.fa", format='fasta')
fa_oo1 <- read.dna("g_p/oo1.fa", format='fasta')
fa_oo2 <- read.dna("g_p/oo2.fa", format='fasta')

## add_strata
df_2$pop = as.factor(s_p[match(rownames(df_2$tab), s_p$X1),]$X2)

## 2bed
df_gpop <- genomic_converter(df_2,output='genepop')
df_hf <- genind2hierfstat(df_2)

# cal
## fst
fst <- genet.dist(df_hf, method='WC84', diploid=F)
fst_tsv <- as.data.frame(as.matrix(fst)) %>%
    rownames_to_column()

## boot_fst
a <- rbind(as.vector(fst))

for(i in 1:1000){
id_boot <- sample(s_p[[1]])
s_p$id2 <- id_boot
df_2$pop = as.factor(s_p[match(rownames(df_2$tab), s_p$id2),]$X2)
df_hf <- genind2hierfstat(df_2)
fst_boot.t <- genet.dist(df_hf, method='WC84', diploid=F)
a <- rbind(a,as.vector(fst_boot.t))
}

fst_boot <- as_tibble(a)
fst_boot %>% slice_max(V1, n = 10)  # 0.001
fst_boot %>% slice_max(V2, n = 10)  # 0.001
fst_boot %>% slice_max(V3, n = 10)  # 0.005

boot.ppfst(dat=df_hf,nboot=2,quant=c(0.025,0.975),diploid=F)

fst.boot(df_gpop,fst.choice="fst",ci=0.05,num.breaks=25,bootstrap = TRUE,min.per.bin=20)

## pi
pi_oa <- hap.div(fa_oa,T)
pi_oo1 <- hap.div(fa_oo1,T)
pi_oo2 <- hap.div(fa_oo2,T)

pi_tsv <- as.data.frame(rbind(pi_oa,pi_oo1,pi_oo2))

# write
write_tsv(fst_tsv,'mito.fst.tsv')
write_tsv(fst_boot, 'mito.fst.boot.tsv')
write_tsv(pi_tsv, 'mito.pi.tsv')

# kk