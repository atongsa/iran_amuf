#!/usr/bin/env bash

setwd('/public/home/d0202110815/at42/proj/iran_amuf/review/ssa/gene/pcdh9') # ovis

# lib
library(tidyverse)
library(ggplot2)
library(gggenes)

# args
df_f <- 'plot.gene.tsv'

# clean
df <- read_tsv(df_f, col_names=F)
names(df) <- c("chr", "trait", 'start', 'end', 'strand', 'direction')

# plot; scales = "free"
p <- ggplot(df,
    aes(xmin = start, xmax = end, y = chr, fill = trait, label = trait, forward = strand)) +
    geom_gene_arrow(data=df[df$trait=="Chr10",], arrowhead_height = unit(0, "mm"), arrowhead_width = unit(0, "mm"), arrow_body_height=unit(1, "mm")) +
    geom_gene_arrow(data=df[df$trait=="AI",], arrowhead_height = unit(0, "mm"), arrowhead_width = unit(0, "mm"), arrow_body_height=unit(17, "mm")) +
    geom_gene_arrow(data=df[df$trait=="QTL",], arrowhead_height = unit(0, "mm"), arrowhead_width = unit(0, "mm"), arrow_body_height=unit(4, "mm")) +
    geom_gene_arrow(data=df[df$trait=="PCDH9",], arrowhead_height = unit(0, "mm"), arrowhead_width = unit(0, "mm"), arrow_body_height=unit(7, "mm")) +
    facet_wrap(~ chr, scales = "free", ncol = 1) +
    scale_color_npg(alpha=0.7) +
#    scale_color_manual(c("#8AAAF6","#50C070")) +
    #scale_x_continuous(limits = gene_len) +
    theme_genes()

# save
ggsave(str_c(gsub(".tsv", '', df_f),".pdf"), p)
#write_rds(p, str_c(df_f,"ud.2M.plot.rds"))

# kk
