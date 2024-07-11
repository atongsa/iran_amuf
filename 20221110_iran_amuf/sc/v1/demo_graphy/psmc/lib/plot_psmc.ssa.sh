#!/usr/bin/env bash

# merge
for f in {IROO-D6-0004,BJ4-1,266}
do
echo $f
cat $f.diploid.psmc $f.round-*.psmc > ../plot/$f.combined.psmc
done

# cd
cd /public/home/d0202110815/at42/proj/iran_amuf/demo_graphy/chr_auto/psmc/plot

for f in {IROO-D6-000{2..6},BJ4-1,266}
do
echo $f
psmc_plot.pl -R -u 1e-08 -g 3 p.$f $f.combined.psmc
epstopdf.pl p.$f.eps p.$f.pdf
done

# ggplot
setwd('/public/home/d0202110815/at42/proj/iran_amuf/demo_graphy/chr_auto/psmc/plot')

library(tidyverse)
library(ggplot2)
library(scales)
library(ggformula)
library(ggsci)
library(ggpubr)
library(extrafont)
loadfonts()

df <- read_tsv('psmc.txt', col_names=F)
df_n <- df %>%
    mutate(line_g=str_extract(X1,pattern = '(?<=p.).*(?=\\.\\d+)')) %>%
    mutate(line_bt=str_extract(X1,pattern = '(?<=\\.)\\d+(?=$)')) %>%
    mutate(size=X3*10000) %>%
    filter(line_g %in% c("266", "IROO-D6-0004"))

df_n2 <- df_n %>%
	filter(X2 >= 10000, X2<=10^7) %>%
	group_split(group=X1) %>%
	map_df(~.x %>% add_row(.[1,], .before = 1) %>%
		assign_in(list(2,1),10000) %>%
		add_row(.[length(.[[2]]),], .after = length(.[[2]])) %>%
		assign_in(list(2,length(.[[2]])),10^7)
	)

# plot
p <- ggplot(data=df_n2, aes(x=X2, y=X3, color=line_g, group=group)) +
  geom_line(linewidth=.2) +
  scale_color_npg(alpha=.7) +
  labs(x=expression("Years (g=3, µ=1x"*10^-8*")"),
      y=expression(italic("Ne") ~ "(x" ~ 10^4* ")")) +
  # scale_x_log10(limits=c(10^4, 10^7),
  #     breaks = trans_breaks("log10", n=3, function(x) 10^x)(c(10^4, 10^7)),
  #     labels = trans_format("log10", math_format(10^.x)),
  #     expand = expansion(add = c(0, 0))) +
  scale_y_log10(limits=c(1,350),
      breaks = trans_breaks("log10", n=3, function(x) 10^x)(c(10^0, 4*10^2)),
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
	annotate("rect", xmin=16000, xmax=310000, ymin=0, ymax=348,
		alpha=0.2, color="NA", fill="blue") # LGM

# legend
p2 <- p1 +
    guides(colour = guide_legend(override.aes = list(alpha=1, linewidth=2))) +
    scale_color_hue(label=expression(italic('O.orientalis_1'), italic('O.orientalis_2')))

# save
ggsave("oo_12.psmc.pdf", p2, width=7, height=7)

# kk
color: "#E64B35B2" "#4DBBD5B2"
TR[2]: theta

LGM:
22000

1)
N0=theta/4mu*100
time=g*2*N0*rs[3]
size=N0*rs[4]
