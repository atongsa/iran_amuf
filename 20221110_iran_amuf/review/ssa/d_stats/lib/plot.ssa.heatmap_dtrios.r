#!/usr/bin/env Rscript

# lib
library(tidyverse)
library(ComplexHeatmap)
library(ggsci)
library(circlize)
library(scales)

# cd
setwd("/public/home/d0202110815/at42/proj/iran_amuf/review/ssa/d_fd/d_trio/plot")

# args
df_f <- 'dsuite.dtrio_36.txt'
op_n <- 'heatmap.D.pdf'

# read
df <- read_tsv(df_f, col_names=F)
ssa_bd <- read_lines("ssa.18.id")

# clean
df_pn <- df %>%
	mutate(pn=(ifelse(X1=="MEN", -log10(X6), 0))) %>%
	mutate(p2=(ifelse(X1=="MEN", X2, X1)))

l2w <- df_pn %>%
	select(-c(1,2,4:10)) %>%
	pivot_wider(names_from = p2, values_from = pn) %>%
	arrange(X3) %>%
	column_to_rownames(var = "X3") %>%
	select(all_of(ssa_bd)) %>%
	as.matrix

## color
my_pal <- pal_npg("nrc", alpha = 0.7)(2)
col_fun <- colorRamp2(breaks = c(0, 1.3, 4),
                    colors = c(my_pal[2], "white", my_pal[1]))

# plot
#df = matrix(rnorm(200), 20, 10)
p_df <- l2w

pdf(op_n, width = 24, height = 4)
ht <- Heatmap(p_df,
        name = "-log10 P", #title of legend
        #column_title = "SSA_breeds",
				#row_title = "Amuf_pops",
		cluster_columns = F,
		cluster_rows = F,
        row_names_gp = gpar(fontsize = 36),
		column_names_gp = gpar(fontsize = 36),
		col=col_fun,
		show_column_dend=F,
		show_row_dend=F
        )
draw(ht)
dev.off()

# kk
