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
The dxy and Fst were calculated for 20 kbp windows with 2 kbp steps using the mens sheep and introgressed SSA population in pixy 1.2.7.beta1 [@korunesPixyUnbiasedEstimation2021]. The haplonet was constructed using pegas v1.1 [@paradisPegasPackagePopulation2010a] for the adaptive introgression region ai_pcdh9. The ldblock was calculated using LDBlockShow v1.40 [@dongLDBlockShowFastConvenient2021] and LD decay was calculated with PopLDdecay v3.42 [@zhangPopLDdecayFastEffective2019]. Heatmaps were generated with complexheatmap v2.14.0 [@guComplexHeatmapsReveal2016].

# Results
We identified five PBS and FD_M selected regions with a total length of 19,614 bp, which we defined as the adaptive introgression region. These five regions overlapped with the sheep QTL database and were found to be associated with traits such as carcass bone percentage, fat percentage, and meat yield. The nearest genes to these regions were PCDH9, TRNAQ-UUG, TRNAW-CCA, and VASH1, as listed in the supplementary table (Supp Table.x.gene.qtl). PCDH9 has been associated with hot environment, fat deposition, and local adaptation [@kimMultipleGenomicSignatures2016a; @serranitoLocalAdaptationsMediterranean2021a; @wangGenomeWideAssociationStudy2011], which is consistent with the associated QTL traits. We focused on the ai_pcdh9 region, which is named after the PCDH9 gene and located upstream of it on chr 10 with 679,309 bp. We calculated the dxy and fst of ai_pcdh9 (Fig. 5C.gene_pcdh9) with up and down 100 kbp, and found that ai_pcdh9 showed a different pattern from other regions. The SSA introgressed breeds had lower diversity, suggesting that ai_pcdh9 was more recent than the divergence of mens sheep, confirming that ai_pcdh9 was introgressed into SSA breeds.

We also calculated the LD of ai_pcdh9 with PCDH9 and found that it did not decay like other regions of chr 10 (Fig. 5A,B.gene_pcdh9), indicating that the ai_pcdh9 region was linked with PCDH9 and might regulate its expression level. The haplonet of ai_pcdh9 (Fig. 5D.gene_pcdh9) showed that meat sheep and small sheep had two main haplogroups, and the SSA introgressed breeds haplogroup was mainly close to the small sheep haplogroup, suggesting that the ai_pcdh9 region maintains a haplotype that regulates sheep body size. The genotype heatmap of ai_pcdh9 (Fig. 5E.gene_pcdh9) showed that the SSA introgressed breeds had a similar pattern to small sheep, with the pattern originating from two *O. orientalis*_1 samples (IROO−K7−0642, IROO−E5−5146), which are located near Sahand, Iran (49.32136E, 36.721474N and 46.393425E, 37.746767N). The exon of PCDH9 did not show any similar pattern (Fig. 5F.gene_pcdh9), indicating that the ai_pcdh9 region regulates the expression level of PCDH9.

# kk
