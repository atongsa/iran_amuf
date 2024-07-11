#!/usr/bin/env Rscript

```sh
for f in *.stat;
do
g_p=${f%.ssa_in.stat}
sed '1 d' $f | awk -vg_p=$g_p 'BEGIN{OFS="\t"}{print g_p, $1, $2}'
done > decay.tsv
```

# cd
setwd('/public/home/d0202110815/at42/proj/iran_amuf/gene/ld_decay/plot')

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

df_f <- 'decay.tsv'
op_n <- 'ld_decay.pdf'

## read
#l_v <- scan(l_v, character(), quote = "")
#f_ls <- paste0(l_vs, '.stat.gz')
#names(f_ls) <- l_vs

df <- read_tsv(df_f, col_names=F) %>%
    sample_frac(.1)

# plot
p <- ggplot(df, aes(x=X2, y=X3, color=X1)) +
    geom_spline(linewidth=1)

pp <- p +
  scale_x_continuous(labels = label_number(scale = 1e-3)) +
  #scale_y_continuous(expand = c(0, 0)) +
  scale_color_npg() +
  labs(color='', x="LD Distance (Kbp)",y=expression(LD~(r^{2}))) +
  theme_pubr(base_size=21, base_family="Arial") +
 # theme(axis.line.x.bottom=element_line(linewidth=2)) +
  #theme(axis.line.y.left=element_line(linewidth=2)) +
  theme(plot.margin = margin(1, 2, 1, 1, "cm"))

# save
ggsave(op_n, pp, width=7, height=7)

# kk
labs(y = expression ("Acceleration in"~m/s^2))
labels = c(expression(italic('C.aegarus')), 'Native', 'Improved')
