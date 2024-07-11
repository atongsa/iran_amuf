#!/usr/bin/env bash

# tsv
```sh
cd /public/home/d0202110815/at42/proj/iran_amuf/demo_graphy/chr_y/plot

for f in {HY1,HY2,o.HY2}.tsv
do
g_p=${f%.tsv}
sed '1,2 d' $f | awk -vg_p=$g_p 'BEGIN{OFS="\t"}{print g_p,$0}'
done > y.all.tsv # 1,3,4,5,6

```

# wd
setwd("/public/home/d0202110815/at42/proj/iran_amuf/demo_graphy/chr_y/plot")

# args
f_l <- 'y.all.tsv'
lv_f <- 'id.lv'
op_n <- 'skyline.y.pdf'

# lib
library(tidyverse)
library(ggplot2)
library(scales)
library(ggformula)
library(ggsci)
library(ggpubr)
library(extrafont)
loadfonts()

# read
df <- read_tsv(f_l, col_names = F)
lv <- read_lines(lv_f) #%>% str_c("mt.", .)

# clean
df_n <- df %>%
    set_names(c("label", "time", "mean", "median", "upper", "lower")) %>%
    mutate(label=factor(label, levels=lv)) %>%
	drop_na %>%
    mutate(time=as.numeric(time)/1000) %>%
	filter(time<=100) %>%
	group_split(group=label) %>%
	map_df(~.x %>%
		add_row(.[length(.[[2]]),], .after = length(.[[2]])) %>%
		assign_in(list(2,length(.[[2]])),100)
	)

#add_row(.[1,], .before = 1) %>%
#    assign_in(list(8,1),1000) %>%

# plot
# #trans_breaks("log10", n=2, function(x) 10^x)(c(0.1, 10)),

## color
my_pal <- pal_npg("nrc", alpha = 1)(7)[c(1,4,7)]

p <- ggplot(df_n) +
	geom_spline(aes(time, log10(median), color=label), linewidth=2) +
    geom_ribbon(aes(ymin=log10(lower),ymax=log10(upper),fill=label, x=time), alpha=0.1) +
    scale_color_manual(values = my_pal) + #
    scale_fill_manual(values = my_pal) +
	labs(x=expression("KYears (Y_snp, µ=7.7x"*10^-9*")"),
        y=expression(italic("Ne"))) +
		#y=expression(italic("Ne") ~ "(x" ~ 10^4* ")")) +
	scale_y_continuous(
        limits = c(4,6),
        breaks = c(4:6),
		labels = c(expression(10^4), expression(10^5), expression(10^6)),
		expand = c(0, 0)) +
	annotation_logticks(sides = "l", outside = T) +
	coord_cartesian(clip="off") +
	theme_pubr(base_size=21, base_family="Arial", border=T) +
	theme(legend.title = element_blank()) +
	theme(plot.margin = margin(0, 2, 1, 1, "cm"))

#p1 <- p + guides(color=guide_legend(nrow=2,byrow=TRUE))

# add_time_line
#8~10 kbp: domestication
#10~12 kbp: predomestication
# p1 <- p +
# 	annotate("rect", xmin=7000, xmax=10000, ymin=700, ymax=170000,
# 		alpha=0.2, color="NA", fill="blue") + # post_dome
# 	annotate("rect", xmin=10000, xmax=12000, ymin=700, ymax=170000,
# 		alpha=0.2, color="NA", fill="green") # pre_dome

# save
ggsave(op_n, p, width=7, height=7)

# kk
