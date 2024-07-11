#!/usr/bin/env Rscript

# reg
```sh
cd /public/home/d0202110815/at42/proj/iran_amuf/zoom_ai/d_inves

for f in *tsv
do
#cut -f1-3,6 $f | awk '$1==10' | sort -k1,1g -k2,2n> $f.bed
bedtools intersect -wa -wb -a $f.bed -b sel.bed2 > plot.$f.bed
done

```

# cd
setwd("/public/home/d0202110815/at42/proj/iran_amuf/zoom_ai/d_inves")

# args
# bge/gar/gur/sum
df_f <- 'plot.SUM.tsv.bed'
op_n <- 'SUM.fdm.pdf'
y_lab <- 'fdm_SUM'
col_r <- mypal["SUM"]

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
#mypal = pal_npg("nrc", alpha = 0.7)(5)[2:5]
#names(mypal) <- c("BGE", "GAR", "GUR", "SUM")
#show_col(mypal)

# plot
p <- ggplot(df, aes(x=X3/10^6, y=X4)) +
    geom_spline(linewidth=2, color=col_r)

## modi
p1 <- p +
    labs(color='', x="chr10(Mbp)",y=y_lab) +
    theme_pubr(base_size=14, base_family="Arial", border=T) +
    theme(legend.title = element_blank()) +
    theme(plot.margin = margin(1, 2, 1, 1, "cm")) +
    scale_y_continuous(expand = expansion(add = c(0, 0)),
        labels = scales::number_format(accuracy = 0.1)) +
    scale_x_continuous(expand = expansion(add = c(0, 0)))

## anno
p2 <- p1 +
	annotate("rect", xmin=41204271/10^6, xmax=41213804/10^6, ymin=min(df$X4), ymax=max(df$X4),
		alpha=0.2, color="NA", fill="blue") # LGM;

## no_xlab
p3 <- p2 +
    theme(
      #axis.text.x = element_blank(),
      #axis.ticks.x = element_blank(),
      axis.title.x = element_blank(),
    ) +
    theme(legend.position="none", legend.title = element_blank())

# save
ggsave(op_n, p3, width=7, height=2)

# kk
