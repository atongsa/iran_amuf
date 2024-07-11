#!/usr/bin/env Rscript

# wd
setwd('/public/home/d0202110815/at42/proj/iran_amuf/review/ssa/gene/hap_heatmap/heatmap')

# args
df_f <- '../ai_exon/exon.hap.mat'

pop_strata <- 'pop.strata'
pop_level <- 'pop.lv'

# lib
library(tidyverse)
library(ComplexHeatmap)
library(ggsci)
library(circlize)
library(scales)
library(extrafont)
loadfonts()

# read
df_snp <- read_delim(df_f, col_names=F, delim='\t')

df_pop <- read_tsv(pop_strata, col_names=F)
pop_lv <- read_lines(pop_level)

# clean
df_pop$X2 <- factor(df_pop$X2, levels=pop_lv)

df_pop_s <- df_pop %>% arrange(X2) %>%
    filter(X2!="BIGS")

df_snp_n <- 
    inner_join(df_pop_s, df_snp, by=c("X1")) %>%
    mutate(X1=factor(X1, levels=X1)) %>%
    select(-c(2)) %>%
    column_to_rownames(., var="X1")

## df_2_mat
mat <- as.matrix(df_snp_n)  # remove/strata/head
mat[1:4, 1:4]

## color
my_pal <- pal_npg("nrc", alpha = 0.7)(5)
col_fun <- colorRamp2(breaks = c(0, 1),
                    colors = c(my_pal[2], my_pal[1]))

## anno
anno_col <- my_pal[3:5] #pal_npg("nrc", alpha = 0.7)(3)
names(anno_col) <- pop_lv[1:3]

ha = rowAnnotation(bar = df_pop_s$X2,
    col = list(bar = anno_col),
    show_annotation_name = F,
    show_legend = F,
    annotation_legend_param = list(
        bar = list(
            direction = "horizontal",
            title = "",
            labels=gt_render(pop_lv[1:3]),
            nrow = 1
            )
        )
    )

# plot
r_n <- 'F'

ht_exon <- Heatmap(mat,
        col = c(my_pal[2], my_pal[1]),#col_fun,
        # left_annotation = ha,
        row_split=df_pop_s$X2,
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
        show_heatmap_legend = F,
        width = 1
        #column_title = str_c("Chr", chr_n),
        #heatmap_legend_param = list(title = ""),
        #left_Annotation = ha,
        #row_title = NULL,
        #column_title = p_tittle,
    )

# kk
ht3 <- ht_ai + ht_exon

op_n <- 'ht.pdf'

pdf(op_n, width = 14, height = 7, family = "Arial")
draw(ht3, padding = unit(c(6, 12, 6, 12), "mm"), annotation_legend_side = "top", legend_grouping = "original") # t/l/b/r
dev.off()
