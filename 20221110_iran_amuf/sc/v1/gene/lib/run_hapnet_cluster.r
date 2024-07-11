#!/usr/bin/env Rscript

# dist
hap_dist <- dist.hamming(hap_type)
m <- as.matrix(hap_dist)

df <- m

a <- hclust(dist(df))
b <- cutree(a, k=3)

hap_clust <- as.data.frame(b) %>% rownames_to_column %>% arrange(b)

# kk
