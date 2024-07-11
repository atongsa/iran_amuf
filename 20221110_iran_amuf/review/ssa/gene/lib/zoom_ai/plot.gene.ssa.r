#!/usr/bin/env bash

setwd('/public/home/d0202110815/at42/proj/iran_amuf/zoom_ai/plot')

# args
df_f <- 'gene.plot.bed'
gene_symbol <- "PCDH9"
gene_len <- c(1,97206448)
# del_name <- 'DEL00034481'

# lib
library(ggplot2)
library(gggenes)
library(ggrepel)
library(extrafont)
loadfonts()

# clean
df <- read_tsv(df_f, col_names=F) %>%
    set_names(c('chr', 'start', 'end', 'trait', 'gene')) #%>%
    #slice(-1)

# plot
# forward = strand
p <- ggplot(df,
    aes(xmin = start, xmax = end, y = gene, fill = trait, label = trait)) +
    scale_x_continuous(limits = gene_len, expand = c(0, 0)) +
    geom_gene_arrow(data=df[df$trait=="chr10",], arrowhead_height = unit(0, "mm"), arrowhead_width = unit(0, "mm"), arrow_body_height=unit(.4, "mm")) +
    geom_gene_arrow(data=df[df$trait=="ai",], arrowhead_height = unit(0, "mm"), arrowhead_width = unit(0, "mm"), arrow_body_height=unit(7, "mm")) +
    geom_gene_arrow(data=df[df$trait=="pcdh9",], arrowhead_height = unit(0, "mm"), arrowhead_width = unit(0, "mm"), arrow_body_height=unit(7, "mm")) +
    geom_gene_arrow(data=df[df$trait=="qtl_size",], arrowhead_height = unit(0, "mm"), arrowhead_width = unit(0, "mm"), arrow_body_height=unit(1, "mm")) +
    geom_gene_arrow(data=df[df$trait=="show",], arrowhead_height = unit(0, "mm"), arrowhead_width = unit(0, "mm"), arrow_body_height=unit(4, "mm")) +
    facet_wrap(~ gene, scales = "free", ncol = 1) +
    scale_fill_brewer(palette ="Set1") +
    theme_genes() +
    theme(text=element_text(family="Arial", size=14))

# save
ggsave("pcdh9.pdf", p, width=8, height=6)
#write_rds(p, str_c(df_f,"ud.2M.plot.rds"))

# kk
