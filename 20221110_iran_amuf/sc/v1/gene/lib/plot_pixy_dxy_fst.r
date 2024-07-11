#!/usr/bin/env Rscript

# args
w_d <- '/public/home/d0202110815/at42/proj/iran_amuf/gene/pixy/plot'

# cd
setwd(w_d)

# lib
library(tidyverse)
library(ggpubr)
library(ggsci)
library(extrafont)
loadfonts()

# color
mypal <- pal_npg("nrc", alpha = 0.7)(2)

# plot
pixy_labeller <- as_labeller(c(avg_pi = "pi",
                             avg_dxy = "D[XY]",
                             avg_wc_fst = "F[ST]"),
                             default = label_parsed)

p <- pixy_df %>%
    filter(chromosome == 10) %>%
    filter(statistic %in% c("avg_dxy", "avg_wc_fst")) %>%
    mutate(chr_position = ((window_pos_1 + window_pos_2)/2)/1000) %>%
    ggplot(aes(x=chr_position, y=value, color=pop2)) +
    geom_line(linewidth = 1) +
    facet_grid(statistic ~ .,
              scales = "free_y", switch = "x", space = "free_x",
              labeller = labeller(statistic = pixy_labeller,
                                  value = label_value)) +
    xlab("Chr10 (Kb)") +
    ylab("") +
    labs(colour="") +
    theme_pubr(base_size=21, base_family="Arial", border=T) +
    theme(
        panel.spacing = unit(0.1, "cm"),
        strip.background = element_blank(),
        strip.placement = "outside",
        legend.position = "top") +
    scale_x_continuous(expand = c(0, 0)) +
    scale_y_continuous(breaks=c(0,0.2,0.4,0.6,0.7), labels = c("0","0.2","0.4","0.6", ""), expand = c(0, 0)) +
    scale_color_manual(values=mypal)
    # limits = c(0,1),
    # scale_color_brewer(palette = "Set1")

# anno; 41204271-41213804
p1 <- p +
    #theme(panel.border = element_rect(colour = "black", fill=NA, linewidth =1)) +
	annotate("rect", xmin=41204, xmax=41213.8, ymin=0, ymax=0.7,
	   alpha=0.1, color="NA", fill="blue") # post_dome

# save
write_rds(p1, 'pixy.rds')

ggsave("pixy.ssa.pdf", p1, width=7, height=7)

# kk
# url: https://pixy.readthedocs.io/en/latest/plotting.html
