#!/usr/bin/env Rscript

# lib
library(tidyverse)
library(ggsci)
library(igraph)
library(pegas)

# wd
setwd("/public/home/d0202110815/at42/proj/iran_sheep/y_chr/hapnet/net_4k")

# clean
net.igraph <- as.igraph.haploNet(hap_net,
                        directed = FALSE,
                        use.labels = TRUE,
                        altlinks = FALSE
												)

## order
#newnums <- as.roman(as.character(V(net.igraph)$name))
#V(net.igraph)$name_n <- newnums
hap_name_od <- V(net.igraph)$name

## size
hap_count <- summary(hap_type)
hap_count_od <- hap_count[hap_name_od]

## pie
#(P <- haploFreq(fa, fac = pop, haplo = hap_type))
pie_df <- t(P[hap_name_od,])
dc.site <- split(pie_df, rep(1:ncol(pie_df), each = nrow(pie_df)))
names(dc.site) <- hap_name_od

## color
length(colnames(P))
#mypal <- pal_npg("nrc", alpha = 0.7)(9)
mypal <- c("white", "white", "white", "white", "white", "#8491B4B2", "#91D1C2B2", "#DC0000B2", "white")
names(mypal) <- colnames(P)

cn_od <- colnames(P)[c(8,6,7,5,3,9,1,4,2)]
c_od <- mypal[cn_od]

## E
ed_ge <- as.data.frame(unclass(hap_net))
ed_ge_ig <- as_data_frame(net.igraph)

#E(g)$width <- ed_ge$Prob
E(net.igraph)$weight <- sqrt(ed_ge$step)
E(net.igraph)$label <- NA #ed_ge$step

## layout
net.igraph$layout <- layout_with_kk(net.igraph)
#attr(net.igraph, "layout") <- NULL
#layout=layout_with_kk(net.igraph)

# plot
pdf("hapnet.igraph.pdf")
plot(net.igraph,
     vertex.shape="pie",
     vertex.pie = dc.site,
     vertex.pie.color=list(mypal),
     vertex.size = 2*(hap_count_od)^(1/2),
     vertex.label = NA,
     vertex.label.cex = 1,
     vertex.label.dist = 2.5
		 ) # layout = layout_nicely(net.igraph, weights = c(1,10))

# lgend
legend(x= "topleft",
       bty="n",
       pt.bg=c_od,
       col="black",
       pch=22,
       legend=cn_od)
dev.off()

# kk
# https://r-graph-gallery.com/248-igraph-plotting-parameters.html
# http://www.cmcurry.com/2014/02/workflow-going-from-geneious-to-r-to.html

unclass(hap_net)

#
