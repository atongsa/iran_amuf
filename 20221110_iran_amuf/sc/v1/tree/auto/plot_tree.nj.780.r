#!/usr/bin/env Rscript

# wd
setwd("/public/home/d0202110815/at42/proj/iran_amuf/phylo/auto/tree")

# lib
library(tidyverse)
library(ape)
library(ggtree)
library(treeio)
library(ggsci)

# args
#args <- commandArgs(trailingOnly = TRUE)
tr_f <- "nj.780.nwk"
anno_f <- "../sam_ple/auto.780.strata"
lv_f <- '../sam_ple/id.lv'
op_n <- "nj.780.pdf"

# read
tree <- read.newick(tr_f) # (args[1])
a_n <- read_tsv(anno_f, col_names=F) # args[2]
gp_lv <- readLines(lv_f)

# root
tree2 <- ape::root(tree, outgroup = "bighorn1", resolve.root = TRUE)

# group
a_n_l <- a_n[c(1,2)] %>% group_by(X2)
ls_n <- group_keys(a_n_l)
a_n_split <- a_n_l %>% group_split() %>% lapply(., '[[', 1)
names(a_n_split) <- ls_n[[1]]

# group
tr_g <- groupOTU(tree2, a_n_split)
attributes(tr_g)$group <- factor(attributes(tr_g)$group, levels = gp_lv)

# plot
p <- ggtree(tr_g, aes(color=group), size=0.1, layout='daylight') +
    theme(legend.position="right", text=element_text(family="Arial")) +
    labs(color='') +
    scale_colour_npg() +
    geom_tiplab(size=.2, show.legend = F)
    #geom_text2(aes(subset=!isTip, label=node), hjust=-.3, size=2)
    #geom_hilight(node=1039, fill="black")

# canvas
p1 <- p +
    ggplot2::xlim(0, 0.06) + ggplot2::ylim(0, 0.1)

# save
ggsave(op_n, p, width=7, height=7)

# kk
