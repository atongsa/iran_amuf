#!/usr/bin/env Rscript

# cat
cat("

grep "Cross-Entropy (masked data):" *log | sort -k4,4n # k=3

p.r
q_f <- '../ssa.3.Q'
pops <- 'ssa.strata'
pop_od <- c("O.orientalis_1", "O.orientalis_2", "SSA")
op_p <- 'snmf.ssa.at'
")

# cd
setwd("/public/home/d0202110815/at42/proj/iran_amuf/review/ssa/admixture/plot")

# lib
library(tidyverse)
library(ggplot2)
library(ggsci)
library(scales)
library(ggpubr)
library(extrafont)
loadfonts()

# args
q_f <- '../snmf/ssa.m5.3.Q'
pops <- '../sam_ple/ssa.strata'
pop_od <- c("O.orientalis_1", "O.orientalis_2", "SSA")
op_p <- 'snmf.ssa'
op_p2 <- 'snmf.ssa.nl'

# read
df <- read.table(q_f)
p_p <- read_tsv(pops, col_names=F)

# clean
p_p$X2 <- factor(p_p$X2, levels=pop_od)

df_n1 <- as.tibble(df) %>%
	mutate(iid=p_p$X1, fid=p_p$X2) %>%
	group_split(group=fid) %>%
	#map_df(~.x %>% mutate(new_group=kmeans(.[,c(1:5)], 2)$cluster))
	map_df(~.x %>% mutate(group=cutree(hclust(dist(as.matrix(.[1:length(df)]))), k=length(df))))
	#kmeans(.[,c(1:length(df))], length(pop_od))$cluster

df_n2 <- df_n1 %>%
	#group_by(fid) %>%
	arrange(fid, group, across(all_of(1:length(df)))) %>%
	mutate(iid=factor(iid, levels=iid))
	#ungroup()
	#across(all_of(1:length(df)))

df_n3 <- df_n2 %>%
	pivot_longer(c(1:length(df)), names_to = "ance", values_to = "value")

mypal <- pal_npg("nrc", alpha = 0.7)(length(df))

# plot_bar
p <- ggplot(df_n3, aes(x = iid, value, fill=ance)) +
	theme_pubr() +
	geom_bar(stat="identity", width = 1, colour=NA, linewidth=0) +
	scale_fill_manual(values=mypal) +
	facet_grid(.~ fid, space = 'free_x', scales = 'free_x', switch = 'x')

## modi
p1 <- p +
	theme(text = element_text(family = "Arial"),
		strip.text.x = element_text(size = 0),
		#axis.text.x = element_text(angle = 90, vjust = 1, hjust=1, size=7)
		# strip.text.x = element_text(angle = 45, vjust = .1, hjust=.1),
		axis.text = element_blank(),
		strip.background = element_blank(),
	  	axis.line = element_blank(),
	  	axis.ticks = element_blank(),
	  	axis.title = element_blank(),
		axis.text.y = element_blank(),
	  	panel.grid = element_blank(),
		legend.position="none",
		panel.spacing = unit(0, "lines"),
		panel.border = element_blank())

ggsave(str_c(op_p, ".pdf"), p1, width=16, height=7)
ggsave(str_c(op_p2, ".pdf"), p1, width=16, height=7)
#write_rds(p1, str_c(op_p, ".rds"))

# write_tsv
write_tsv(df_n2, "snmf.k3.tsv")

# kk
