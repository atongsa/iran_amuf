#!/usr/bin/env Rscript

# usage
cat("plot_pca.r eigen_vector eigen_value\n")

# setwd
setwd("/public/home/d0202110815/at42/proj/iran_amuf/review/iroo_structure/pca")

# lib
library(tidyverse)
library(ggpubr)
library(ggsci)
library(ggrepel)

# args
#args <- commandArgs(trailingOnly = TRUE)
e_val <- 'chr14.eigenval'
e_vec <- 'chr14.eigenvec'

pop_f <- 'amuf.pop.tsv'

pve_n <- 'amuf_pve'
pca_n <- 'amuf_pca'

# read
pca <- read_table(e_vec, col_names = FALSE) # args[1]
eigenval <- scan(e_val) # args[2]

# clean
pca_m <- pca[,-1]
names(pca_m)[1] <- "ind"
names(pca_m)[2:ncol(pca_m)] <- paste0("PC", 1:(ncol(pca_m)-1))

# loc_spe
loc_spe <- read_tsv(pop_f, col_names = FALSE) #%>% select(c(X1, X3))

names(loc_spe) <- c("sp_id", 'pop')

# full_join
pca2 <- left_join(pca_m, loc_spe, by=c('ind'='sp_id'))

# pve
pve <- data.frame(PC = 1:19, pve = eigenval/sum(eigenval)*100)

pve_p <- ggplot(pve, aes(PC, pve)) +
    geom_bar(stat = "identity") +
    theme_pubr(base_size=12) +
    ylab("Percentage variance explained")

ggsave("pve.pdf", plot=pve_p, width=4, height=4)

pve_stat <- cumsum(pve$pve)
write_lines(pve_stat, "pve.tsv") # 26/39/27

# plot_pca; col = loc, shape=spe
p_c <- pca2
pc_p <- ggplot(p_c, aes(PC1, PC2, color=pop)) +
    geom_jitter(size = 4, width=.02, height=.02) +
    theme_pubr(base_size=14) +
    xlab(paste0("PC1 (", signif(pve$pve[1], 3), "%)")) +
    ylab(paste0("PC2 (", signif(pve$pve[2], 3), "%)")) +
    #scale_shape_manual(values=1:2) +
    scale_color_npg()

# anno
pp_anno <- pc_p +
    geom_text_repel(data=p_c, aes(x=PC1, y=PC2, label=ind), size=2, box.padding = unit(.35, "lines"), point.padding = unit(0, "lines"), nudge_x = .15,  nudge_y = 0.15, key_glyph = "rect")
    #scale_colour_discrete(labels = c("high", "low"))

#ggsave('pca.amuf.svg', plot=pc_p, width=7, height=7)
ggsave('pca.amuf.lb.pdf', plot=pp_anno, width=7, height=7)

# kk
