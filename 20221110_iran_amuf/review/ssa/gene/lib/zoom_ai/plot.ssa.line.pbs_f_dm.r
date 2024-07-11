#!/usr/bin/env Rscript

# cd
setwd("/public/home/d0202110815/at42/proj/iran_amuf/review/ssa/gene/pbs_fdm")

# args
# pbs/BGE/GUR/NES/SUM
df_f <- 'rg.pbs.fdm.bed'
lv_f <- 'gp.lv'
op_n <- 'plot.pbs_fdm.pdf'

# lib
library(tidyverse)
library(scales)
library(ggformula)
library(ggsci)
library(ggpubr)
library(extrafont)
loadfonts()

# read
df <- read_tsv(df_f, col_names=F)
lv <- read_lines(lv_f)

# clean
df_n <- df %>%
    mutate(label=factor(X5, levels=lv))

# plot
p <- ggplot(df_n, aes(x=X2/10^6, y=X4, color=label)) +
    geom_spline(linewidth=2) +
    scale_color_npg(alpha=.7)

## label
pixy_labeller <- as_labeller(c(pbs = "PBS",
                             bge = "f[dM]~BGE",
                             gur = "f[dM]~GUR",
                             nes = "f[dM]~NES",
                             sum = "f[dM]~SUM"),
                             default = label_parsed)

## facet
p1 <- p +
    facet_grid(label ~ .,
            scales = "free_y", switch = "x", space = "free_x",
            labeller = labeller(label = pixy_labeller,
            value = label_value)) +
    xlab("Chr10 (Mbp)") +
    ylab("") +
    labs(colour="") +
    theme_pubr(base_size=14, base_family="Arial", border=T) +
    theme(
        panel.spacing = unit(0, "cm"),
        strip.background = element_blank(),
        strip.placement = "outside",
        legend.position = "top") #+
    # scale_x_continuous(expand = c(0, 0)) +
    # scale_y_continuous(breaks=c(0,0.2,0.4,0.6,0.7), labels = c("0","0.2","0.4","0.6", ""), expand = c(0, 0)) +
    # scale_color_manual(values=mypal)

## modi
p2 <- p1 +
    labs(color='', x="chr10(Mbp)") +
    theme(legend.title = element_blank()) +
    theme(plot.margin = margin(1, 1, 1, 1, "cm")) +
    scale_y_continuous(expand = expansion(add = c(0, 0)),
        labels = scales::number_format(accuracy = 0.1)) +
    scale_x_continuous(expand = expansion(add = c(0, 0)))

## anno
p3 <- p2 +
	annotate("rect", xmin=41205017/10^6,
        xmax=41212664/10^6, ymin=0, ymax=0.4,
		alpha=0.2, color="NA", fill="blue") # LGM;

## no_xlab
p4 <- p3 +
    #theme(
      #axis.text.x = element_blank(),
      #axis.ticks.x = element_blank(),
      #axis.title.x = element_blank(),
    #) +
    theme(legend.position="none", legend.title = element_blank())

# save
ggsave(op_n, p4, width=7, height=7)

# kk
