#!/usr/bin/env Rscript

# wd
setwd('/public/home/d0202110815/at42/proj/iran_amuf/gene/heatmap/')

# args
#args <- commandArgs(trpcdh9_exonlingOnly = TRUE)
df_f_ai <- 'snp_df/ai.df.space.tsv'
#df_f_pcdh9 <- 'snp_df/pcdh9.df.space.tsv'
df_f_pcdh9_exon <- 'snp_df/pcdh9_exon.df.space.tsv'

pop_f <- 'sam_ple/size.strata'
pop_level <- 'sam_ple/s.id.lv'

# lib
library(tidyverse)
library(ComplexHeatmap)
library(ggsci)
library(circlize)
library(scales)
library(extrafont)
loadfonts()

# read
df_snp_ai <- read_delim(df_f_ai, col_names=T, delim=' ')
df_snp_pcdh9_exon <- read_delim(df_f_pcdh9_exon, col_names=T, delim=' ')

df_pop <- read_tsv(pop_f, col_names=F)
pop_lv <- read_lines(pop_level)

# clean
df_pop$X2 <- factor(df_pop$X2, levels=pop_lv)

df_sel_ai <- inner_join(df_pop, df_snp_ai, by=c("X1"="FID")) %>%
    arrange(X2)

df_sel_pcdh9_exon <- inner_join(df_pop, df_snp_pcdh9_exon, by=c("X1"="FID")) %>%
    arrange(X2)

## df_2_mat
hm_mat <- function(df_sel, pop_lv, ha, r_n){

mat <- as.matrix(df_sel[-c(1:2)])  # remove/strata/head
rownames(mat) <- df_sel[[1]]
mat[1:4, 1:4]

## color
my_pal <- pal_npg("nrc", alpha = 0.7)(9)
col_fun <- colorRamp2(breaks = c(0, 1, 2),
                    colors = c("white", my_pal[7], my_pal[1]))

# plot
ht <- Heatmap(mat,
        col = col_fun,
        left_annotation = ha,
        row_split=df_sel$X2,
        cluster_rows = T,
        cluster_row_slices = F,
        cluster_columns = F,
        show_row_dend = F,
        show_row_names = r_n,  # show_or_not
        row_names_gp = gpar(fontsize = 7), # row_show_font
        show_column_names = F,
        row_title_rot=0,
        row_title = NULL,
        column_names_side = c("bottom"),
        column_names_gp = gpar(fontsize = 14),
        #column_labels = c_l,
        column_names_rot = 0,
        column_names_centered = T,
        show_heatmap_legend = F
        #column_title = str_c("Chr", chr_n),
        #heatmap_legend_param = list(title = ""),
        #left_Annotation = ha,
        #row_title = NULL,
        #column_title = p_tittle,
    )
return(ht)
}

## anno
anno_col <- pal_npg("nrc", alpha = 0.7)(7)
names(anno_col) <- pop_lv

ha = rowAnnotation(bar = factor(df_sel_ai$X2, levels=pop_lv),
    col = list(bar = anno_col),
    show_annotation_name = F,
    show_legend = F,
    annotation_legend_param = list(
        bar = list(
            direction = "horizontal",
            title = "",
            labels=gt_render(pop_lv),
            nrow = 1
            )
        )
    )

# plot
r_n <- 'F'

ht_ai <- hm_mat(df_sel_ai, pop_lv, ha, r_n)
#ht_pcdh9 <- hm_mat(df_sel_pcdh9, pop_lv, ha, r_n)
ht_pcdh9_exon <- hm_mat(df_sel_pcdh9_exon, pop_lv, ha, r_n)

# save
h_t <- ht_ai
op_n <- 'plot/ht.ai.png'

png(op_n, width = 700, height = 700, family = "Arial")
draw(h_t, padding = unit(c(6, 12, 6, 12), "mm"), annotation_legend_side = "top", legend_grouping = "original") # t/l/b/r
dev.off()

h_t <- ht_pcdh9_exon
op_n <- 'plot/ht.pcdh9_exon.png'

pdf(op_n, width = 7, height = 7, family = "Arial")
draw(h_t, padding = unit(c(6, 12, 6, 12), "mm"), annotation_legend_side = "top", legend_grouping = "original") # t/l/b/r
dev.off()

# kk
