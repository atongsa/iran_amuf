#!/usr/bin/env Rscript
#SBATCH -J a.fst #sm_sp.at42_id_1.at42_id_2
#SBATCH -p Gnode # Fnode2/Fnode1/Gnode/Cnode; kdy:xhacnormala
#SBATCH -N 1
#SBATCH -n 2
#SBATCH --mem 60G
#SBATCH -t 4-00:00
#SBATCH -o j.at42_id.o
#SBATCH -e j.at42_id.e

```sh
bcftools view input.vcf.gz -r 1 auto.vcf.gz
v_f='/public/home/d0202110815/at42/proj/iran_amuf/chr_auto/pk_779/b2v/4.vcf.gz'
bcftools view --force-samples -S ../s_p/auto.id $v_f > auto.chr4.sel.vcf
```

# cd
setwd("/public/home/d0202110815/at42/proj/iran_amuf/fst_pi/auto")

# lib
library(gaston)
library(hierfstat)
library(ggpubr)
library(vcfR)
library(adegenet)
library(tidyverse)
library(Matrix)

# args
#v_f <- '../v_f/t.id.vcf'
v_f <- 'auto.chr4.sel.vcf' #  # ../v_f/t.id.vcf
pop <- '../s_p/auto.strata'

# clean
## read
df <- read.vcfR(v_f) # auto
df_2 <- vcfR2genind(df)

s_p <- read_tsv(pop, col_names=F)

## add_strata
df_2$pop = as.factor(s_p[match(rownames(df_2$tab), s_p$X1),]$X2)

## 2bed
df_hf <- genind2hierfstat(df_2)

# cal
fst <- genet.dist(df_hf, method='WC84', diploid=T)
#boot.ppfst(dat=df_hf,nboot=2,quant=c(0.025,0.975),diploid=F)
ci <- boot.ppfst(df_hf,diploid=TRUE,nboot=1000)

# tsv
fst_tsv <- as.data.frame(as.matrix((triu(as.matrix(fst))))) %>%
    rownames_to_column() %>%
    pivot_longer(-1, names_to = "pop", values_to = "fst") %>%
    filter(!fst==0)

ci_l <- as.data.frame(ci$ll) %>%
    rownames_to_column() %>%
    pivot_longer(-1, names_to = "pop", values_to = "ci_l") %>%
    filter(!is.na(ci_l))

ci_u <- as.data.frame(ci$ul) %>%
    rownames_to_column() %>%
    pivot_longer(-1, names_to = "pop", values_to = "ci_u") %>%
    filter(!is.na(ci_u))

ci_tsv <- ci_l %>%
    inner_join(ci_u, c("rowname", "pop")) %>%
    mutate(pvalue=ifelse(ci_l>0 & ci_u >0, "p<0.05", "noSig"))

fst_ci <- fst_tsv %>%
    inner_join(ci_l, c("rowname", "pop")) %>%
    inner_join(ci_u, c("rowname", "pop")) %>%
    mutate(pvalue=ifelse(ci_l>0 & ci_u >0, "p<0.05", "noSig"))

# write
write_tsv(ci_tsv, 'auto.fst.ci.tsv')

# kk