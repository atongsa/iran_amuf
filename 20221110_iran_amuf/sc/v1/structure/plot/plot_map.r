#!/usr/bin/env Rscript

# wd
setwd('/public/home/d0202110815/at42/proj/iran_sheep/structure/map')

# args
df_f <- 'amuf.tsv'
op_n <- 'amuf.map.pdf'

# lib
library(tidyverse)
library(ggplot2)
library(scatterpie)
library(ggpubr)
library(ggrepel)
library(ComplexHeatmap)

# read
df <- read_tsv(df_f, col_names=F)
names(df) <- c("sid", "did", "pop", 'gp', "lat", "long")

# clean
# long/lat/region/a:d/radius
df_c <- df %>%
    drop_na(lat, long)

df_a <- df_c %>%
    select(pop, lat, long) %>%
    distinct() %>%
    group_by(pop) %>%
    summarise(mn_lat=min(lat), mx_lat=max(lat), mn_lon=min(long), mx_lon=max(long))

#ann_df <- data.frame(pop=c("HS", "IR"), lat=c(28, 39), long=c(58,44))
ann_df <- data.frame(pop=c("pop1", "pop2"), lat=c(38, 29), long=c(47,44))

# plot_base
world <- map_data('world')

p <- ggplot(world, aes(long, lat)) +
    geom_map(map=world, aes(map_id=region), fill='#4DBBD533', color="NA")

# plot_dot
pp <- p + geom_jitter(aes(x=long, y=lat, color=pop), # , r=4
                    data=df_c, width=.4, height=.4, show.legend = FALSE)

# anno
pp_anno <- pp +
    geom_text_repel(data=ann_df, aes(x=long, y=lat, label=pop, col=pop), size=12, box.padding = unit(.35, "lines"), point.padding = unit(0, "lines"), nudge_x = .15,  nudge_y = 0.15, show.legend = FALSE)

# plot
ppp <- pp_anno +
    theme_pubr(base_size=12) +
    theme(
    plot.title = element_blank(),
    plot.margin = margin(0, 0, 0, 0, 'cm'),
    axis.line=element_blank(),
    axis.ticks=element_blank(),
    axis.text=element_blank(),
    axis.title = element_blank(),
    legend.position="none")

# region
p2 <- ppp + coord_cartesian(xlim = c(40, 60),  ylim = c(25, 45))

# save
ggsave(op_n, p2, width=7, height=7)

# kk
