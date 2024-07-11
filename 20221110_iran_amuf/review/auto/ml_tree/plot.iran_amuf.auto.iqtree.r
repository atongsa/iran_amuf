#!/usr/bin/env Rscript

# wd
setwd("/public/home/d0202110815/at42/proj/iran_amuf/review/auto_tree")

# lib
library(tidyverse)
library(ape)
library(ggtree)
library(treeio)
library(ggsci)
library(extrafont)
loadfonts()


# args
#args <- commandArgs(trailingOnly = TRUE)
tr_f <- "tree.auto.41.treefile"
anno_f <- "sp.strata"
lv_f <- 'sp.lv'
op_n <- "auto.41.pdf"

# read
tree <- read.newick(tr_f) # (args[1])
a_n <- read_tsv(anno_f, col_names=F) # args[2]
gp_lv <- readLines(lv_f)

# root
tree2 <- ape::root(tree, node=62, 
    resolve.root = TRUE, edgelabel = TRUE)

# group
a_n_l <- a_n[c(1,3)] %>% group_by(X3)
ls_n <- group_keys(a_n_l)
a_n_split <- a_n_l %>% group_split() %>% lapply(., '[[', 1)
names(a_n_split) <- ls_n[[1]]

# group
tr_g <- groupOTU(tree2, a_n_split)
attributes(tr_g)$group <- factor(attributes(tr_g)$group, levels = gp_lv)

# color
c_l <- pal_npg('nrc', alpha=0.7)(7)[c(1,2,4)]
show_col(c_l)

# plot; aes(color=group)
p <- ggtree(tr_g, aes(color=group),
    size=1, layout='circular') +
    theme(legend.position="right", text=element_text(family="Arial")) +
    labs(color='') +
    scale_color_manual(values=c_l) +
    geom_treescale() +
    geom_text2(aes(subset=!isTip, label=label), hjust=-.3, size=2) +
    geom_tiplab(offset=0.01, size=4, show.legend = F)
    # geom_text(aes(label=node)) +
    # geom_text2(aes(subset=!isTip, label=node), hjust=-.3, size=2)
    #geom_hilight(node=1039, fill="black")

# canvas
#p1 <- p +
    # ggplot2::xlim(0, 0.06) + ggplot2::ylim(0, 0.1)

# save
ggsave(op_n, p, width=7, height=7)

# kk
