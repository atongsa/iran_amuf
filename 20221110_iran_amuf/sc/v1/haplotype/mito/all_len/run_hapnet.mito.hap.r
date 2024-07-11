#!/usr/bin/env Rscript

# cd
setwd('/public/home/d0202110815/at42/proj/iran_amuf/hap_net/mito/all_len/popart_hap')

# lib
library(ape)
library(pegas)
library(tidyverse)
library(ggsci)

# args
fa_f <- '../fa/sel.st.fa' # 260; 243
loc_spe <- '../sam_ple/mt.hap.st.strata'

# clean
fa <- read.dna(fa_f, format='fasta')
l_b <- read_tsv(loc_spe, col_names=F)

# haplotype
hap_type <- haplotype(fa)
hap_type # 593

# net
#d <- dist.dna(hap_type, "N")
#nt <- rmst(d, quiet = TRUE)

#hap_net <- mjn(fa) # print.default

hap_net <- haploNet(hap_type)

#hap_net <- nt

# plot
#plot(hap_net, threshold = c(1, 14))

## size
(sz <- summary(hap_type))
(nt.labs <- attr(hap_net, "labels"))
sz <- sz[nt.labs]
#plot(hap_net, size = sz)

## label
#region <- l_b$X2 #rep(c("regA", "regB"), each = 40)
pop <- l_b$X10 #rep(paste0("pop", 1:4), each = 20)

#(R <- haploFreq(fa, fac = region, haplo = hap_type))
(P <- haploFreq(fa, fac = pop, haplo = hap_type))

#R <- R[nt.labs, ]
P <- P[nt.labs, ]
P2 <- P[,c(8,6,7,1:5,9)]

## color
# length(colnames(P))
# mypal_f <- pal_npg("nrc", alpha = 0.7)
# mypal <- pal_npg("nrc", alpha = 0.7)(length(colnames(P)))
# names(mypal) <- colnames(P)

# library(scales)
# mypal_f <- hue_pal(c=80, l=70)
# mypal <- mypal_f(length(colnames(P2)))
# names(mypal) <- colnames(P2)
#show_col(mypal)

#cn_od <- colnames(P)[c(8,6,7,5,3,9,1,4,2)]
#c_od <- mypal[cn_od]

# plot
#getHaploNetOptions
# setHaploNetOptions(labels=T, labels.cex=0.02,
#     show.mutation = 3, mutations.cex=0.02,
#     pie.colors.function=mypal_f,
# 	link.width=0.02, scale.ratio = 1) # cex = 0.8
#
# ## change_steps
# hap_net_n <- hap_net
# hap_net_n[,3] <- sqrt(hap_net_n[,3]) * 0.4 + 1
#
# # draw
# pdf("hapnet.mito.hap.lb.pdf", width=7, height=7)
# plot(hap_net, size=sqrt(sz)*2, pie=P2, threshold=0) # sqrt(sz)
# legend(x="topright", legend=names(mypal), bty="n", pt.bg=mypal, col="black", pch=22)
# dev.off()

#legend(50,50, colnames(ind.hap2), col=rainbow(ncol(ind.hap2)), pch=20, # text.col=2:5)
#legend("topleft", colnames(P), col=rainbow(ncol(P)), pch=20)

# save_net
## net
sink("hap_net.pegas.txt")
print.default(hap_net)
sink()

## hap_size
hp_sz <- as.data.frame(sz) %>% rownames_to_column

## hap_pop
p_w <- as.data.frame(P2) %>% rownames_to_column

## hap_fa
hp_id <- list(attributes(hap_type))[[1]]$index
#hp_id_sel <- unlist(lapply(hp_id, `[[`, 1))

## fa_name
fa_name <- list(attributes(fa))[[1]]$dimnames[[1]]

## merge
hap_name <- list()
for (i in 1:length(attributes(hap_type)$dimnames[[1]])){
hap_name[i] <- str_c(fa_name[hp_id[[i]]], collapse=",")
}
hap_name_v <- unlist(hap_name)

#bind_cols(p_w, hap_name_v)
hap_tsv <- bind_cols(size=hp_sz, id=hap_name_v, pop=p_w[,2:length(p_w)])

write_tsv(hap_tsv, "hap_net.tsv", col_names = T)

# rds
write_rds(hap_net, 'hap_net.rds')
#read_rds('mito.hap_net.rds')

# kk
