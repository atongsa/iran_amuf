#!/usr/bin/env Rscript

# cd
setwd('/public/home/d0202110815/at42/proj/iran_amuf/gene/hapnet/hap_type')

# args
fa_f <- '../fa/sel.ai.hap.fa'
sp_stra <- '../fa/ai.hap.og_new.strata'

# lib
library(ape)
library(pegas)
library(tidyverse)
library(ggsci)
library(extrafont)
loadfonts()

# read
fa <- read.dna(fa_f, format='fasta')
l_b <- read_tsv(sp_stra, col_names=F)

# haplotype
hap_type <- haplotype(fa)

# net
hap_net <- haploNet(hap_type)

#d <- dist.dna(hap_type, "N")
#hap_net <- rmst(d, quiet = TRUE)

# plot
#plot(hap_net, threshold = c(1, 14))

## size
(sz <- summary(hap_type))
(nt.labs <- attr(hap_net, "labels"))
sz <- sz[nt.labs]
#plot(hap_net, size = sz)

## label
#region <- l_b$X2 #rep(c("regA", "regB"), each = 40)
pop <- l_b$X3 #rep(paste0("pop", 1:4), each = 20)

#(R <- haploFreq(fa, fac = region, haplo = hap_type))
(P <- haploFreq(fa, fac = pop, haplo = hap_type))

#R <- R[nt.labs, ]
P <- P[nt.labs, ]
P2 <- P[,c(3:5,2,7,6,1)]

## color
length(colnames(P2))
mypal_f <- pal_npg("nrc", alpha = 0.7)
mypal <- pal_npg("nrc", alpha = 0.7)(length(colnames(P)))
names(mypal) <- colnames(P2)

#cn_od <- colnames(P)[c(8,6,7,5,3,9,1,4,2)]
#c_od <- mypal[cn_od]

# plot
#getHaploNetOptions
setHaploNetOptions(labels=F, show.mutation = 0, pie.colors.function=mypal_f,
	link.width=0.2, scale.ratio = 1.4) # cex = 0.8

## change_steps
hap_net_n <- hap_net
#hap_net_n[,3] <- sqrt(hap_net_n[,3])

# draw
pdf("ai.hapnet.pdf", width=7, height=7, family = "Arial")
plot(hap_net_n, size=14*sqrt(sz), pie=P2, threshold=0, font=1, cex=0.4) # sqrt(sz)
legend(x="topright", legend=names(mypal), bty="n", pt.bg=mypal, col="black", pch=22)
dev.off()

#legend(50,50, colnames(ind.hap2), col=rainbow(ncol(ind.hap2)), pch=20, # text.col=2:5)
#legend("topleft", colnames(P), col=rainbow(ncol(P)), pch=20)

# write_hap_net
## net
# sink("hap_net.txt")
# print.default(hap_net_n)
# sink()

## hap_freq
h_p <- as.data.frame(sz) #%>% rownames_to_column

## pop
p_w <- as.data.frame(P2) #%>% rownames_to_column

## write_hap_type
hap_list <- attributes(hap_type)$index
hap_df <- plyr::ldply(hap_list, rbind)

hap_df_2 <- as_tibble(apply(hap_df, 2, function(x){deframe(l_b[x,2])}))

hap_df_3 <- hap_df_2 %>% unite("sp_name", 1:26, na.rm = TRUE, sep=',')
hap_name <- tibble(hap_name=attributes(hap_type)$dimnames[[1]])

hap_df_4 <- bind_cols(hap_name, hap_df_3)

## merge
hap_info <- bind_cols(h_p, hap_df_4, p_w) %>% select(c(2,1,3:length(.)))

## write_info
write_tsv(hap_info, "hap_info.tsv")

## write_hap_net
sink("hap_net.txt")
print.default(hap_net_n)
sink()

less -S hap_net.txt | head -n 40 | tr -s ' ' | sed 's/^ //' |\
    cut -f2- -d' ' | tail -n +2 | tr ' ' '\t' > hap_net.tsv

# kk
