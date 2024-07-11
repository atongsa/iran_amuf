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
For autosomal chromosomes, we obtained a total of 780 samples comprising 158 domestic breeds, as well as 32 Iranian mouflon samples, 9 urial samples, and 1 bighorn sample (refer to Supplementary Table S1). Furthermore, we assembled 797 mitochondrial genomes and downloaded 153 mitochondrial genomes from the NCBI GenBank [@clarkGenBank2016] (refer to Supplementary Table S2). For the Y chromosome, we specifically selected 239 male samples from the total 780 samples for further analysis (refer to Supplementary Table S3).

The South and Southeast Asia populations encompass a total of 19 breeds, namely: Bangladeshi, Baruwal sheep, Garole, Garut/Priangan, Indian_Garole, Indonesia Thin-Tailed sheep, Jaffna Local sheep, Kachi sheep, Kage sheep, Kajli sheep, Karakul sheep, Kilakarsal sheep, Madras Red sheep, Mecheri sheep, Nellore sheep, Pattanam sheep, Sumatra, Thalli sheep, and Vembur sheep.

## Mitogenome assembling, processing
We downloaded five mitochondrial genomes (listed in Supplementary Table S4) from NCBI GenBank [@clarkGenBank2016] to serve as references for the five haplotypes of sheep mitochondrial genomes. We included a total of 797 individuals (including 9 O. vignei individuals, 31 O. orientalis individuals, and 727 domestic sheep) that were described in Supplementary Table S2 and had a bam depth of at least 100. We assembled the complete mitochondrial genome using the following steps: 1) conversion of BAM files to fastq format; 2) generation of the mitogenome consensus sequence from the fastq files using MIA v1.0 (https://github.com/mpieva/mapping-iterative-assembler). Additionally, we retrieved 153 domestic sheep mitogenome sequences from NCBI GenBank [@clarkGenBank2016]. The final dataset included a total of 950 individuals, comprising 31 O. orientalis mitogenomes, 9 O. vignei mitogenomes, and the remainder being domestic sheep mitogenomes.

All sequences were aligned using MAFFT v7.515 [@katohMAFFTMultipleSequence2013] and trimmed with TrimAl [@capella-gutierrezTrimAlToolAutomated2009]. We further filtered the alignment to include only the cytochrome b (cytb) region for haplotype network and phylogenetic analyses.

## Y chromosome processing
SNPs were filtered to ensure that only male-specific single-copy region SNPs were retained. We utilized PLINK v1.90b6.26 [@chang2015] with the --check-sex option to distinguish female and male samples. The length of the Y chromosome is 10.6 Mbp, and we initially excluded the final 1.06 Mbp of highly repetitive sequences [@liHuSheepGenome2021]. To ensure the reliability of the SNPs, the mean sequencing depth of each SNP (for all included individuals) was required to be >1/2× and <2× of the expected depth in the Y chromosome (half of the genome-wide depth). Furthermore, we removed SNPs that were heterozygous in at least one of the male samples. Ultimately, we retained 4096 SNPs for Y chromosome haplogroup and phylogenetic analysis.

# kk
