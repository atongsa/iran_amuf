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

# Phylo and Haplotype analysis
We conducted phylogenetic and haplotype analyses for the mitochondrial genome and Y chromosome SNPs. The mitochondrial genome sequences were aligned using mafft v7.515 [@katohMAFFTMultipleSequence2013], and the multiple sequence alignment (MSA) was trimmed using trimal [@capella-gutierrezTrimAlToolAutomated2009]. We constructed a maximum likelihood (ML) tree with iqtree2 v2.0.7 [@minhIQTREENewModels2020], utilizing the site model GTR + G with 1000 bootstrap replicates. The resulting tree was rooted with O. canadensis as an outgroup and visualized using ggtree [@yuUsingGgtreeVisualize2020]. We retained parsimony-informative sites in the trimmed MSA using clipkit [@steenwykClipKITMultipleSequence2020a], and constructed a haplonet with the R package pegas v1.1 [@paradisPegasPackagePopulation2010a]. Haplotypes were constructed with pegas::haplotype, and the median-joining haplotype network was constructed with pegas::haploNet and visualized with pegas::plot.

For Y chromosome SNPs, we transformed the filtered SNPs to fasta format using vcf2phylip.py. The resulting fasta was trimmed using trimal [@capella-gutierrezTrimAlToolAutomated2009]. We constructed a maximum likelihood (ML) tree and visualized it as we did with the mitochondrial genome. We retained parsimony-informative sites in the trimmed MSA using clipkit [@steenwykClipKITMultipleSequence2020a]. We constructed a haplonet using the R package pegas v1.1 [@paradisPegasPackagePopulation2010a], and constructed haplotypes with pegas::haplotype. Finally, we constructed a median-joining haplotype network using pegas::haploNet and visualized it with pegas::plot.

# Phylo and Haplotype analysis
We observed that one mitochondrial haplotype in O. orientalis (haplotype 1) was closely related to MtC/E, and these two lineages were distantly related to the main domestic sheep haplotype MtA/B (Figure 2A). Similarly, the domestic sheep Y2 lineage was closely related to O. orientalis haplotype 1, and distantly related to the main Y1A/B lineage (Figure 2B). The lack of shared mitochondrial and Y haplotypes between domestic sheep and O. orientalis provides evidence that the Iranian mouflon is not the direct ancestor of domestic sheep. Instead, our analysis suggests the possibility of introgression of O. orientalis haplotype 1 into domestic sheep, which is related to MtC/E and Y2. Further investigation is needed to confirm this hypothesis.

# kk
