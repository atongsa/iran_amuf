#!/usr/bin/env Rscript

# args
w_d <- '/public/home/d0202110815/at42/proj/iran_amuf/demo_graphy/chr_auto/smcpp/plot'
f_l <- 'smc.esti.csv'
lv_f <- 'id.lv'

# wd
setwd(w_d)

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
df <- read_csv(f_l)
lv <- read_lines(lv_f)

# clean
df$label <- factor(df$label, levels=lv)

df_n <- df %>%
	filter(x >= 1000, x<=100000) %>%
	group_split(group=label) %>%
	map_df(~.x %>% add_row(.[1,], .before = 1) %>%
		assign_in(list(2,1),1000) %>%
		add_row(.[length(.[[2]]),], .after = length(.[[2]])) %>%
		assign_in(list(2,length(.[[2]])),100000)
	)

# plot
p <- ggplot(df_n, aes(x, y, color=label)) +
	stat_spline(linewidth=1) +
	scale_color_npg(alpha=.7) +
	labs(x=expression("Years (g=3, µ=1.01x"*10^-8*")"),
		y=expression(italic("Ne"))) +
	scale_x_log10(limits=c(1000, 100000),
		breaks = trans_breaks("log10", n=2, function(x) 10^x)(c(10^3, 10^5)),
		labels = trans_format("log10", math_format(10^.x)),
		expand = expansion(add = c(0, 0))) +
	scale_y_log10(limits=c(200,80000),
		breaks = trans_breaks("log10", n=2, function(x) 10^x)(c(10^3, 10^5)),
		labels = trans_format("log10", math_format(10^.x)),
		expand = c(0, 0)) +
	annotation_logticks(sides = "bl", outside = T) +
	coord_cartesian(clip="off") +
	theme_pubr(base_size=21, base_family="Arial", border=T) +
	theme(legend.title = element_blank()) +
	theme(plot.margin = margin(1, 2, 1, 1, "cm"))

# add_time_line
#8~10 kbp: domestication
#10~12 kbp: predomestication
p1 <- p +
	annotate("rect", xmin=10000, xmax=12000, ymin=200, ymax=80000,
		alpha=0.2, color="NA", fill="green") # pre_dome

    # annotate("rect", xmin=7000, xmax=10000, ymin=200, ymax=80000,
	# 	alpha=0.2, color="NA", fill="blue") + # post_dome

# save
ggsave("ssa.smc.esti.pdf", p1, width=7, height=7)

# kk
