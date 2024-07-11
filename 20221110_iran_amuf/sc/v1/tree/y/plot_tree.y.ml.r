#!/usr/bin/env Rscript

# lib
library(tidyverse)
library(ape)
library(ggtree)
library(treeio)
library(ggsci)

# setwd
setwd('/public/home/d0202110815/at42/proj/iran_amuf/phylo/y/plot')

# args
#args <- commandArgs(trailingOnly = TRUE)
tree <- read.newick("y_1000.treefile") # (args[1])
op_p <- "tree.y.ml" #args[3]

# group
<!-- a_n <- read_tsv("y.id.strata", col_names=F) # args[2]
a_n_l <- a_n[c(1,2)] %>% group_by(X2)
ls_n <- group_keys(a_n_l)
a_n_split <- a_n_l %>% group_split() %>% lapply(., '[[', 1)
names(a_n_split) <- ls_n[[1]]
gp_lv <- readLines('lv.id') -->

# a_n_spe <- a_n[c(1,3)] %>% group_by(X3)
# spe_n <- group_keys(a_n_spe)
# a_n_spe_split <- a_n_spe %>% group_split() %>% lapply(., '[[', 1)
# names(a_n_spe_split) <- spe_n[[1]]
# spe_gp_lv <- readLines('gp.lv')

# merge
#anno_tip <- read_tsv("sp/goat_breed_n.strata", col_names=F) # args[2]
#colnames(anno_tip) <- c("label", "pop_label")
#tr3 <- as_tibble(tree2)
#tr4 <- full_join(tr3, anno_tip, by = 'label') %>% as.treedata

# plot
#tip_s <- as.vector(na.omit(offspring(as_tibble(tree), 716)$label))
#to_drop <- tip_s
#tr2 <- drop.tip(tree2, to_drop)

# tree2df
#df <- as_tibble(tree)
#write_tsv(df, 'tree.df.tsv')

# plot
tree2 <- ape::root(tree, node=409, resolve.root = TRUE)
p1 <- ggtree(tree2, layout='circular', branch.length='none') +
    geom_tiplab(size=3, show.legend = F) +
    #geom_nodelab()
    geom_text2(aes(subset=(node==417), label=node), hjust=-.3, size=4) # !isTip

# collapse
<!-- tree_df <- tr_g %>% as.treedata %>% as_tibble

tree_df[tree_df$label == "YZ.9",] # 93
tree_df[tree_df$label == "TH.1",] # 87
MRCA(tree, 93, 87) # 409

tree_df[tree_df$label == "Wad-Sn3",] # 11
tree_df[tree_df$label == "KATO3092",] # 239
MRCA(tree, 11, 239) # 240/H1a
ancestor(tree, 240) -->

<!-- child(tree,934) # 935, 1214
child(tree, 1743)

offspring(tree, 934)
ancestor(tree, 282) -->

p_h2 <- collapse(p1, 340, "none") +
    geom_point2(aes(subset=(node==340)), size=4, shape=23, fill="green")

#a <- offspring(tree2, 334)
#b <- a[-c(1,2)]
p_h1b <- collapse(p_h2, 417, "none") +
    geom_point2(aes(subset=(node==417)), size=4, shape=23, fill="blue")

p_h1a <- collapse(p_h1b, 333, "none") +
    geom_point2(aes(subset=(node==333)), size=4, shape=23, fill="red")

ggsave("y.bt1000.pdf", p_h1b, width=7, height=7)

# annotation
#r_col <- hue_pal(c=70, l=70)(3)

# canvas
p1 <- p +
    ggplot2::xlim(0, 0.06) + ggplot2::ylim(0, 0.1)

# save
ggsave(str_c(op_p, ".pdf"), p, width=7, height=7)

# kk
