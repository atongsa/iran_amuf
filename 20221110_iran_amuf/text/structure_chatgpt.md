---
bibliography: "/mnt/sda1/Documents/proj/read/paper/zotero_cite_lib/at42_lib.yaml"
#csl: "cell.csl"

zotero:
  library: # omitted to use your personal library
  scannable-cite: false # only relevant when you're compiling to scannable-cite .odt
  client: zotero # defaults to zotero
  author-in-text: false # when true, enabled fake author-name-only cites by replacing it with the text of the last names of the authors
  csl-style: "cell" # pre-fill the style
---

# methods
## ADMIXTURE and PCA
We performed quality control on the SNPs by filtering those with missing rates less than 0.1 and minor allele frequencies greater than 0.001 using PLINK v1.90b6.26 [@chang2015]. Subsequently, we pruned the remaining 3,139,107 SNPs with parameters --indep-pairwise 50 10 0.1. We used these filtered and pruned SNPs as input for the admixture analysis using sNMF [@frichotFastEfficientEstimation2014]. We set the number of ancestral groups (K) to range from 2 to 14. We further performed principal component analysis (PCA) on our dataset comprising of 770 samples.

## Phylogenetic relationship inference
For autosomes, we first computed the samples' identity by descent (IBD) using PLINK v1.90b6.26 [@chang2015] with --distance square 1-ibs based on 3,139,107 pruned single nucleotide polymorphisms (SNPs). Next, we generated a neighbor-joining (NJ) tree using the R function ape::bionj [@paradisApeEnvironmentModern2019]. The tree was rooted using O.vignei as an outgroup, and its graphical representation was obtained using ggtree [@yuUsingGgtreeVisualize2020].

For mitochondrial DNA, we aligned the sequences with mafft v7.515 [@katohMAFFTMultipleSequence2013], and the multiple sequence alignment (MSA) was trimmed using trimal [@capella-gutierrezTrimAlToolAutomated2009]. A maximum likelihood (ML) tree was then constructed with iqtree2 v2.0.7 [@minhIQTREENewModels2020] using the site model GTR + G with 1000 bootstrap replicates. The resulting tree was rooted with O.canadensis as an outgroup and visualized using ggtree [@yuUsingGgtreeVisualize2020].

# results
We observed the clustering of 32 Iranian Asiatic mouflon samples into two groups. The larger group, designated as O.orientalis 1, comprised 25 samples, while the smaller group, designated as O.orientalis 2, comprised 7 samples (Fig. 1A; Supplementary Table S2). Upon merging these 32 samples with other domestic sheep samples, we did not observe the two Iranian mouflon clusters, which could be attributed to the influence of domestic sheep (Fig. 1B).

We constructed a phylogenetic tree using a total of 770 samples, including Iranian Asiatic mouflon and domestic sheep samples. We found that the Iranian Asiatic mouflon samples still formed two clusters, which was consistent with the principal component analysis (PCA) results (Fig. 1C), while the domestic sheep samples clustered based on their geographic distribution. The admixture analysis results were consistent with the phylogenetic tree results (Fig. 1D).

We hypothesized whether the two mouflon populations were direct ancestors or had gene flow with domestic sheep, as archaeology has suggested that Iran (Zagros mountain) might have been the center of sheep domestication [@zederDomesticationEarlyAgriculture2008].

# kk
