#!/usr/bin/env Rscript

# sh_clean
```bash
cd /public/home/d0202110815/at42/proj/iran_amuf/d_stats/pbs/pbs_filter/plot

ln -s ../p1.pbs.all.shuf.tsv pbs.all.b
cat <(cut -f1,3,6 pbs.all.b) <(cut -f1-3 ../manh_anno/manh.fake.tsv) > pbs.tsv

plot_manh_pbs.r

```

# ref
cat("http://www.sthda.com/english/wiki/ggplot2-texts-add-text-annotations-to-a-graph-in-r-software\n")
cat('https://www.r-graph-gallery.com/101_Manhattan_plot.html')
cat('plot_manh_ggplot2.r $plot_pbs $chr_num manh.symbol.pos $manh_op_p\n')

# wd
setwd("/public/home/d0202110815/at42/proj/iran_amuf/d_stats/pbs/pbs_filter/plot")

# args
#args <- commandArgs(trailingOnly = TRUE)
#pb_s <- args[1]
# chr_n <- args[2]
# anno_df <- args[3]
# op_p <- args[4]

pb_s <- 'pbs.tsv'
chr_n <- '26'
anno_df <- 'manh.fake.tsv'
op_n <- 'manh.pbs.anno_ai_qtl.pdf'
#tt_s <- 'ssa4_pbs'

# lib
library(tidyverse)
library(ggrepel)
library(ggpubr)
library(ggsci)
library(plotly)

# read
df <- read_tsv(pb_s, col_names=F)
colnames(df) <- c("chr", "pos", 'pbs')

df_anno <- read_tsv(anno_df, col_names=F)
colnames(df_anno) <- c("chr", "pos", 'pbs', 'gene')

# clean
df_n <- df %>%
    filter(chr %in% seq(as.numeric(chr_n))) %>%
    mutate(chr=as.numeric(chr)) %>%
		mutate(pbs=ifelse(pbs<0, runif(1,0,0.2), pbs))

df_pos <- df_n %>%
  # Compute chromosome size
  group_by(chr) %>%
  summarise(chr_len=max(pos)) %>%
  # Calculate cumulative position of each chromosome
  mutate(tot=cumsum(chr_len)-chr_len) %>%
  select(-chr_len) %>%
  # Add this info to the initial dataset
  left_join(df_n, ., by=c("chr"="chr")) %>%
  # Add a cumulative position of each SNP
  arrange(chr, pos) %>%
  mutate(pos_cum=pos+tot)

## x_axis
c_h <- c(1:7, seq(9,as.numeric(chr_n),4), as.numeric(chr_n))
df_axis <- df_pos %>% group_by(chr) %>% summarize(center=( max(pos_cum) + min(pos_cum) ) / 2 ) %>% filter(chr %in% c_h)

## anno_df
df_anno_pos <- df_anno %>%
	right_join(df_pos, ., by=c("chr"="chr", 'pos'='pos', "pbs")) %>%
    distinct()

    #%>%
	#pivot_wider(names_from=gene, values_from = gene)

## anno_line
h_l <- df_pos %>% slice_max(pbs, prop=.01) %>% tail(1) %>% .$pbs #%>% round(2)

# plot
p <- ggplot(df_pos, aes(x=pos_cum, y=pbs)) +
    geom_point(aes(color=as.factor(chr)), alpha=1, size=1) +
    scale_color_manual(values = rep(c("#BEBEBEB3", '#4DBBD5B2'), ceiling(as.numeric(chr_n) / 2)))

# p_adj
p1 <- p +
    scale_x_continuous(limits = c(0,max(df_pos$pos_cum)), label = df_axis$chr, breaks= df_axis$center, expand = expansion(mult = c(0, 0))) +
    scale_y_continuous(expand = expansion(mult = c(0, 0))) +
    theme_pubr(base_size=21, base_family="Arial") +
    labs(title = "", x = "", y = "PBS") +
    theme(legend.position="none")

# anno
p2 <- p1 +
geom_hline(yintercept=h_l, linetype="dashed") +
geom_point(data=df_anno_pos, color="black", size=2) +
geom_text_repel(data=df_anno_pos, aes(label=gene), size=4, box.padding = unit(.35, "lines"), point.padding = unit(.35, "lines"), nudge_x = .35,  nudge_y = 0.35, max.overlaps=40)

# save
ggsave(op_n, p2, width=16, height=9)
#write_rds(p, paste0(op_p, '.rds'))

# kk
