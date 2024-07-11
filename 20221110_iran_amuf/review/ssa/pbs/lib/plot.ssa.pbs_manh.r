#!/usr/bin/env Rscipt

args <- commandArgs(trailingOnly = TRUE)

# wd
setwd("/public/home/d0202110815/at42/proj/iran_amuf/review/ssa/pbs/anno/ai/manh")

#args
pbs_f <- args[1]
anno_f <- args[2]

chr_n <- args[3]
op_p <- args[4]

# lib
library(tidyverse)
library(ggplot2)
library(ggrepel)
library(ggpubr)
library(ggsci)
library(plotly)
library(extrafont)
loadfonts()

# read
pbs <- read_tsv(pbs_f) %>%
    select(c(1,2,6))
#    mutate(CHROM=str_replace(CHROM,"X", '27')) %>% 
#    mutate(CHROM=as.numeric(CHROM))
colnames(pbs) <- c('chr', "pos", 'pbs')

# clean
pbs_sig <- pbs %>% slice_max(pbs, prop=.01)
pbs_sig_line <- pbs_sig %>% arrange(pbs) %>% 
    slice_min(pbs, n=1) %>% .[[1,3]]

# plot
# read
df <- pbs

df_anno <- read_tsv(anno_f, col_names=F)
colnames(df_anno) <- c("chr", "pos", 'gene')

# clean
# %>% mutate(col_gp=ifelse(chr %% 2 == 1, "c1", "c2"))
df_c <- df %>%
    filter(chr %in% seq(as.numeric(chr_n))) %>%
    mutate(chr=as.numeric(chr))

df_pos <- df_c %>%
  # Compute chromosome size
  group_by(chr) %>%
  summarise(chr_len=max(pos)) %>%
  # Calculate cumulative position of each chromosome
  mutate(tot=cumsum(chr_len)-chr_len) %>%
  select(-chr_len) %>%
  # Add this info to the initial dataset
  left_join(df_c, ., by=c("chr"="chr")) %>%
  # Add a cumulative position of each SNP
  arrange(chr, pos) %>%
  mutate(pos_cum=pos+tot)

## x_axis
c_h <- c(1:7, seq(10,as.numeric(chr_n),4), as.numeric(chr_n))
df_axis <- df_pos %>% group_by(chr) %>% summarize(center=( max(pos_cum) + min(pos_cum) ) / 2 ) %>% filter(chr %in% c_h)

## anno_df
df_anno_pos <- df_anno[c(1,2,3)] %>%
    inner_join(df_pos, by=c("chr"="chr", 'pos'='pos'))

## anno_line
#h_l <- df_pos %>% slice_max(fst, prop=.05) %>% tail(1) %>% .$fst #%>% round(2)
h_l <- pbs_sig_line

# plot
p <- ggplot(df_pos %>% slice_sample(n=7000), aes(x=pos_cum, y=pbs)) +
    geom_point(aes(color=as.factor(chr)), size=1) +
    scale_color_manual(values = rep(c("#BEBEBEB3", '#4DBBD5B2'), ceiling(as.numeric(chr_n) / 2)))

# p_adj
p1 <- p +
    scale_x_continuous(limits = c(0,max(df_pos$pos_cum)), label = df_axis$chr, breaks= df_axis$center, expand = expansion(mult = c(0, 0))) +
    scale_y_continuous(expand = expansion(mult = c(0, 0))) +
    theme_pubr(base_size=42) +
    labs(title = op_p, x = "", y = "PBS") +
    theme(legend.position="none")

# anno; df_anno_pos[df_anno_pos$c_f %in% "green",]
p2 <- p1 +
geom_hline(yintercept=h_l, linetype="dashed") +
geom_point(data=df_anno_pos, color='black', size=2) +
geom_text_repel(data=df_anno_pos, aes(label=gene), size=6, box.padding = unit(.45, "lines"), point.padding = unit(.45, "lines"), nudge_x = .45,  nudge_y = 0.45, max.overlaps=40)


#geom_text_repel(data=df_anno_pos, aes(label=gene), size=7, box.padding = unit(.35, "lines"), point.padding = unit(0, "lines"), nudge_x = .35,  nudge_y = 0.35, color="#007757", fontface='italic')

#theme(plot.margin = margin(1, 2, 1, 1, "cm"))

# coor
#p3 <- p2 + coord_fixed(ratio=1)
#p + coord_fixed(ratio = 1/5)

# save
ggsave(str_c(op_p, ".pdf"), p2, width=16, height=9)

#write_rds(p, paste0(op_p, '.rds'))

# kk
#theme_pubr(base_size=14, base_family="Arial", border=T)