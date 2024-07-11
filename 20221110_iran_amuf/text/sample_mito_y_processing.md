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

## Samples
For autosome chromosomes, we achieved a total of 780 samples from 158 domestic breeds and 32 iranian mouflon samples, 9 urial samples and 1 bighorn sample (Supplementary Table S1). And for mitochondria, we assembled 797 mitochondria genomes and download 153 mitochondria genome from ncbi genebank [@clarkGenBank2016] (Supplementary Table S2). For Y chromosomes, We select 239 male samples from 780 samples for analysis (Supplementary Table S3).

South-and-Southeast Asia populations include 19 breeds: Bangladeshi, Baruwal sheep, Garole, Garut/Priangan, Indian_Garole, Indonesia ThinTailed sheep, Jaffna Local sheep, Kachi sheep, Kage sheep, Kajli sheep, Karakul sheep, Kilakarsal sheep, Madras Red sheep, Mecheri sheep, Nellore sheep, Pattanam sheep, Sumatra, Thalli sheep and Vembur sheep.

## Mitogenome assembling, processing
We downloaded 5 mitochondria genomes (Supplementary Table S4) from ncbi genebank [@clarkGenBank2016] as the references of 5 haplotypes of sheep mitochondria genome. We kept 797 individuals (including 9 O.vignei individuals, 31 O.orientalis and 727 domestic sheep) described in (Supplementary Table S2), with a bam depth larger than 100 to assemble the complete mitochondrial genome with following steps: 1) Transforming BAM files to fastq format; 2) assembling mitogenome consensus sequence using fastq files by MIA v1.0 (https://github.com/mpieva/mapping-iterative-assembler). Another 153 domestic sheep mitogenome sequences were retrieved from ncbi genebank [@clarkGenBank2016].
The final dataset included 950 individuals, 31 of whom are O.orientalis mitogenomes, 9 of whom are O.vignei mitogenomes and the remains are domestic sheep mitogenomes.

All sequence were aligned using mafft v7.515 [@katohMAFFTMultipleSequence2013].  The alignment was trimmed by trimal [@capella-gutierrezTrimAlToolAutomated2009]. We further filtered the alignment to keep only cytb region for haplonet and phylogenetic analysis.

## Y chromosome processing
SNPs were filtered to ensure that only male-specific single-copy region SNPs were kept. We used PLINK v1.90b6.26 [@chang2015] option --check-sex to distinguish female and male samples. The length of Y chr is 10.6 Mbp, we first removed the last 1.06 Mbp of highly repetitive sequences [@liHuSheepGenome2021]. And To ensure the confidence of the SNPs, mean sequencing depth of each SNP (for all included individuals) should be >1/2× and <2× of the expected depth in Y chromosome (half of the genome-wide depth). SNPs that were heterozygous in at least one of the male samples were also removed. At last, we kept 4096 SNPs for Y chromosome haplonet and phylogenetic analysis.

# kk
