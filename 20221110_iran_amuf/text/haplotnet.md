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
For mitochondrial genome, we aligned the sequences with mafft v7.515 [@katohMAFFTMultipleSequence2013], and the multiple sequence alignment (MSA) was trimmed using trimal [@capella-gutierrezTrimAlToolAutomated2009]. A maximum likelihood (ML) tree was then constructed with iqtree2 v2.0.7 [@minhIQTREENewModels2020] using the site model GTR + G with 1000 bootstrap replicates. The resulting tree was rooted with O.canadensis as an outgroup and visualized using ggtree [@yuUsingGgtreeVisualize2020]. The parsimony-informative sites was keeped in the trimmed MSA by clipkit [@steenwykClipKITMultipleSequence2020a]. The haplonet was constructed with the R package pegas v1.1 [@paradisPegasPackagePopulation2010a]. The haplotype was constructed by pegas::haplotype, the median-joining haplotype network was constructed by pegas::haploNet and visualized by pegas::plot.

For Y Chromosome SNPs, the filtered SNPs was transformed to fasta by vcf2phylip.py. The fasta was trimmed using trimal [@capella-gutierrezTrimAlToolAutomated2009]. A maximum likelihood (ML) tree was constructed and visualized like mitochondrial. The parsimony-informative sites was keeped in the trimmed MSA by clipkit [@steenwykClipKITMultipleSequence2020a]. The haplonet was constructed with the R package pegas v1.1 [@paradisPegasPackagePopulation2010a]. The haplotype was constructed by pegas::haplotype, the median-joining haplotype network was constructed by pegas::haploNet and visualized by pegas::plot.

# Phylo and Haplotype analysis
We found that some *O.orientalis* 1 mitochondiral haplotype is so close to MtC/E, and these two lineage is far away from the MtA/B, which is the main domestic sheep haplotype (Fig.2A). And the domestic sheep Y2 lineage is so close to *O.orientalis* 1 and far away from the main Y1A/B lineage (Fig.2B). Both mitochondiral and Y haplotype don't share with domestic sheep, it's a proof that irannian mouflon is not the direct ancestor of domestic sheep. We hypothesised that Irannian mouflon *O.orientalis* 1 may be have some introgression into domestic sheep, which related to MtC/E and Y2.

# kk
