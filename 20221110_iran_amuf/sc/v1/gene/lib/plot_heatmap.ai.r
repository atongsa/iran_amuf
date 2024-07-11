#!/usr/bin/env Rscript

# wd
setwd('/public/home/d0202110815/at42/proj/iran_amuf/gene/hapnet/plot')

# args
df_f <- 'vf.tsv'

pop_f <- 'ai.hap.og_new.strata'
pop_level <- 'id.lv'

# lib
library(tidyverse)
library(ComplexHeatmap)
library(ggsci)
library(circlize)
library(scales)
library(extrafont)
loadfonts()

# read
df_snp <- read_delim(df_f, col_names=T, delim='\t')

df_pop <- read_tsv(pop_f, col_names=F)
pop_lv <- read_lines(pop_level)

# clean
df_snp_n <- t(column_to_rownames(df_snp, var="POS"))
# df_snp_n2 <- as_tibble(df_snp_n) %>%
#     mutate(rn=rownames(df_snp_n)) %>%
#     select(147, 2:146)

df_pop$X3 <- factor(df_pop$X3, levels=pop_lv)

#df_sel <- inner_join(df_pop, df_snp_n2, by=c("X2"="rn")) %>%
#     arrange(X3)

## df_2_mat
mat <- as.matrix(df_snp_n)  # remove/strata/head
mat[1:4, 1:4]

## color
my_pal <- pal_npg("nrc", alpha = 0.7)(4)
col_fun <- colorRamp2(breaks = c(0, 1),
                    colors = c(my_pal[2], my_pal[1]))

## anno
anno_col <- pal_npg("nrc", alpha = 0.7)(4)
names(anno_col) <- pop_lv

ha = rowAnnotation(bar = df_pop$X3,
    col = list(bar = anno_col),
    show_annotation_name = F,
    show_legend = T,
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

ht <- Heatmap(mat,
        col = c(my_pal[2], my_pal[1]),#col_fun,
        left_annotation = ha,
        row_split=df_pop$X3,
        cluster_rows = F,
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
        width = 2
        #column_title = str_c("Chr", chr_n),
        #heatmap_legend_param = list(title = ""),
        #left_Annotation = ha,
        #row_title = NULL,
        #column_title = p_tittle,
    )

#ht_pcdh9 <- hm_mat(df_sel_pcdh9, pop_lv, ha, r_n)

# save
op_n <- 'ht.ai.pdf'

pdf(op_n, width = 7, height = 7, family = "Arial")
draw(ht, padding = unit(c(6, 12, 6, 12), "mm"), annotation_legend_side = "top", legend_grouping = "original") # t/l/b/r
dev.off()

# kk
