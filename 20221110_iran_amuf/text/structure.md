---
bibliography: "/mnt/sda1/Documents/proj/read/paper/zotero_cite_lib/at42_lib.yaml"
#csl: "cell.csl"

zotero:
  library: # omitted to use your personal library
  scannable-cite: false # only relevant when you're compiling to scannable-cite .odt
  client: zotero # defaults to zotero
  author-in-text: false # when true, enabled fake author-name-only cites by replacing it with the text of the last names of the authors
  csl-style: "Genome Biology and Evolution" # pre-fill the style
---

# methods
## ADMIXTURE and PCA
The SNPs were filtered with missing rates < 0.1 and minor allele frequency(MAF) > 0.001, then pruned with parameters: --indep-pairwise 50 10 0.1, using PLINK v1.90b6.26 [@chang2015]. The filtered and pruned 3,139,107 SNPs were used as input for sNMF with arguments -c [@frichotFastEfficientEstimation2014] to do admixture analysis. The number of ancestral groups (K) was set from 2 to 10. We performed PCA of our dataset with the 779 samples.

## Phylogenetic relationship inference
For autochromosomes, we first calculate samples IBD by PLINK v1.90b6.26 [@chang2015] with --distance square 1-ibs using the pruned 3,139,107 SNPs, then we calculate nj tree with R function ape::bionj [@paradisApeEnvironmentModern2019], the tree was visualized by ggtree [@yuUsingGgtreeVisualize2020] using *O.vignei* as outgroup. For mitochondria, we first align the sequences with mafft v7.515 [@katohMAFFTMultipleSequence2013], the msa was trimed by trimal [@capella-gutierrezTrimAlToolAutomated2009], maximum likelihood tree was constructed with iqtree2 v2.0.7 [@minhIQTREENewModels2020] with site model GTR + G and 1000 bootstraps. Tree was visualized by ggtree [@yuUsingGgtreeVisualize2020] using *O.canadensis* as outgroup.

# results
We found 32 iranian asiatic mouflon samples grouped into two clusters, the biger cluster we named *O.orientalis* 1 has 25 samples, the smaller cluster we named *O.orientalis* 2 has 7 samples (Fig.1A; Supplementary Table S2). We put the 32 iranian asiatic mouflon samples with the other domestic sheep, and don't find the two iranian mouflon cluster, which maybe caused by the pull of domestic sheep (Fig.1B).
We make a phylogenetic tree with iranian asiatic mouflon and domestic sheeps, totally 770 samples. And found that, the iranian asiatic mouflon still grouped into 2 clusters, which is consistent with pca results (Fig.1C) and the domestic sheep was grouped into geographic distribution. The admixture analysis results showed that the similiar results as phylogenetic tree (Fig.1D).
We hypothesised that whether the two mouflon pops was the directly ancestor or had gene flow with domestic sheep, as the archaeology found that iran(Zagros moutain) maybe the domestic center of sheep [@zederDomesticationEarlyAgriculture2008].

# kk
