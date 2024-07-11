#!/usr/bin/env Rscript

# lib
library(tidyverse)
library(ggpubr)
library(ggsci)
library(ggformula)
library(scales)
library(extrafont)
loadfonts()

# args
#args <- commandArgs(trailingOnly = TRUE)
df_f <- 'decay.tsv' #args[1] #'decay.tsv'
op_n <- 'ld_decay.pdf' #'ld_decay.pdf'
lv_f <- 'gp.lv'

## read
l_v <- scan(lv_f, character(), quote = "")
df <- read_tsv(df_f, col_names=F) %>%
  mutate(c_l=factor(X1, levels=l_v))

# plot
p <- ggplot(df, aes(x=X2, y=X3, color=c_l)) +
    geom_spline(linewidth=2)

pp <- p +
  scale_x_continuous(labels = label_number(scale = 1e-3)) +
  #scale_y_continuous(expand = c(0, 0)) +
  scale_color_npg() +
  labs(color='', x="LD Distance (Kbp)",y=expression(LD~(r^{2}))) +
  theme_pubr(base_size=21, base_family="Arial") +
 # theme(axis.line.x.bottom=element_line(linewidth=2)) +
  #theme(axis.line.y.left=element_line(linewidth=2)) +
  theme(plot.margin = margin(1, 1, 1, 1, "cm"))

# save
ggsave(op_n, pp, width=7, height=7)

# kk
#labs(y = expression ("Acceleration in"~m/s^2))
#labels = c(expression(italic('C.aegarus')), 'Native', 'Improved')
