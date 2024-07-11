#!/usr/bin/env Rscript

# lib
library(tidyverse)
library(ggpubr)
library(ggsci)

# cd
setwd("/public/home/d0202110815/at42/proj/iran_sheep/structure/kmean")

# args
df_f <- 'iran_sheep.amuf.eigenvec'

# read
pca_m <- read_table(df_f, col_names=F) %>% select(c(2:4))

# clean
df <- as.matrix(pca_m[c(2,3)])
rownames(df) <- pca_m[[1]]

# hclust
a <- hclust(dist(df))
b <- cutree(a, k=2)

# kk
