#!/usr/bin/env Rscript

# lib
library(tidyverse)
library(ComplexHeatmap)
library(ggsci)
library(circlize)
library(scales)

# cd
setwd("/public/home/d0202110815/at42/proj/iran_amuf/d_stats/plot")

# args
df_f <- 'dtrio_36_D.tsv'
op_n <- 'f4_ratio.heatmap.pdf'

# read
df <- read_tsv(df_f, col_names=F)
ssa_bd <- read_lines("ssa.18.tsv")

# clean
df_pn <- df %>%
	mutate(p2=(ifelse(X1=="MEN", X2, X1)))

l2w <- df_pn %>%
	select(-c(1,2,4:6)) %>%
	pivot_wider(names_from = p2, values_from = X7) %>%
	arrange(X3) %>%
	column_to_rownames(var = "X3") %>%
	select(all_of(ssa_bd)) %>%
	as.matrix

## color
my_pal <- pal_npg("nrc", alpha = 0.7)(2)
col_fun <- colorRamp2(breaks = c(0, max(l2w)),
                    colors = c("white", my_pal[1]))

# plot
#df = matrix(rnorm(200), 20, 10)
p_df <- l2w

pdf(op_n, width = 24, height = 4)
ht <- Heatmap(p_df,
        name = "f4-ratio", #title of legend
        #column_title = "SSA_breeds",
				#row_title = "Amuf_pops",
        row_names_gp = gpar(fontsize = 36),
				column_names_gp = gpar(fontsize = 36),
				col=col_fun,
				show_column_dend=F,
				show_row_dend=F,
				border=T,
				rect_gp = gpar(col = "black", lwd = .4)
        )
draw(ht)
dev.off()

# kk
