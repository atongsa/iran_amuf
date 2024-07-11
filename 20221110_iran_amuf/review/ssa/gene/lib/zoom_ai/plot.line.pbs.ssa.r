#!/usr/bin/env Rscript

# cd
setwd("/public/home/d0202110815/at42/proj/iran_amuf/zoom_ai/pbs")

# args
df_f <- 'plot.pbs.tsv'
op_n <- 'ssa.pbs.pdf'

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

# clean
mypal = pal_npg("nrc", alpha = 0.7)(5)

# plot
p <- ggplot(df, aes(x=X2/10^6, y=X3, color=mypal[1])) +
    stat_spline(linewidth=2)

## modi
p1 <- p +
    labs(color='', x="chr10(Mbp)",y=expression("PBS")) +
    theme_pubr(base_size=14, base_family="Arial", border=T) +
    theme(legend.title = element_blank()) +
    theme(plot.margin = margin(1, 2, 1, 1, "cm")) +
    scale_y_continuous(expand = expansion(add = c(0, 0))) +
    scale_x_continuous(expand = expansion(add = c(0, 0)))

## anno
p2 <- p1 +
	annotate("rect", xmin=41204271/10^6, xmax=41213804/10^6, ymin=0, ymax=max(df$X3),
		alpha=0.2, color="NA", fill="blue") # LGM

## no_xlab
p3 <- p2 +
    theme(
      axis.text.x = element_blank(),
      axis.ticks.x = element_blank(),
      axis.title.x = element_blank(),
    ) +
    theme(legend.position="none", legend.title = element_blank())

# save
ggsave(op_n, p3, width=7, height=2)

# kk
