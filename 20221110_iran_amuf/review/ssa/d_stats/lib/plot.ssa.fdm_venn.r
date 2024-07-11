#!/usr/bin/env Rscript

# args
w_d <- '/public/home/d0202110815/at42/proj/iran_amuf/review/ssa/d_fd/d_inves/venn'
df_f <- 'one.base.venn.bed'
op_n <- 'ssa_4_fd_overlap.pdf'

# cd
setwd(w_d)

# lib
library(tidyverse)
library(ggvenn)
library(ggsci)
library(scales)

# read
df <- read_tsv(df_f, col_names=F)

# clean
df_n <- df %>%
	mutate(rg_lb=rownames(.)) %>%
	mutate(BGE=ifelse(X3==1, rg_lb, NA)) %>%
	mutate(GUR=ifelse(X4==1, rg_lb, NA)) %>%
	mutate(NES=ifelse(X5==1, rg_lb, NA)) %>%
	mutate(SUM=ifelse(X6==1, rg_lb, NA)) %>%
	select(-c(1:6))

## my_colr
my_pal <- pal_npg("nrc", alpha = 0.7)(4)
# red/blue/green/dark_blue
# "#E64B35B2" "#4DBBD5B2" "#00A087B2" "#3C5488B2"

rg_ls <- list(BGE=na.omit(df_n$BGE),
	GUR=na.omit(df_n$GUR),
	NES=na.omit(df_n$NES),
	SUM=na.omit(df_n$SUM))

# plot
gene_list <- rg_ls

set.seed(42)
p1 <- ggvenn(gene_list,
	fill_color=my_pal,
	fill_alpha=0.7,
	stroke_alpha=0,
	stroke_size=.1,
	set_name_color=my_pal,
	digits=2)

#p1 + scale_x_continuous(expand = expansion(mult = .2))

# save
ggsave(op_n, p1, width=7, height=7)
write_rds(p1, "p1.rds")
write_rds(df_n, "df_new.rds")

# kk
