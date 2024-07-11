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
The dxy and Fst was calculated with pixy 1.2.7.beta1 [@korunesPixyUnbiasedEstimation2021] for 20 kbp windows with 2 kbp steps using the mens sheep and introgressed SSA population.
The haplonet was constructed with the adaptive introgression region ai_pcdh9 using pegas v1.1 [@paradisPegasPackagePopulation2010a].
The ldblock was calculated and viewed with LDBlockShow v1.40 [@dongLDBlockShowFastConvenient2021]. LD decay was calculated with PopLDdecay v3.42 [@zhangPopLDdecayFastEffective2019]. Heatmap was ploted with complexheatmap v2.14.0 [@guComplexHeatmapsReveal2016].

# results
there are 5 pbs and fd_m both selected regions, total length 19,614 bp, which was defined as adaptive introgression region, the five regions overlaped with sheep QTL database, and found that these regions are associated with traits like: Carcass bone percentage, fat percentage, meat yield, and so one, the nearst genes from the 5 ai region are: PCDH9, TRNAQ-UUG, TRNAW-CCA, and VASH1 (Supp Table.x.gene.qtl). PCDH9 is associated with hot environment, fat deposition and local adaptation [@kimMultipleGenomicSignatures2016a; @serranitoLocalAdaptationsMediterranean2021a; @wangGenomeWideAssociationStudy2011], which is consistent with the associated QTL traits, so we focused on the pcdh9 gene associated ai region, we named this region ai_pcdh9 here after. the region ai_pcdh9 located on chr 10 which was upstream of gene PCDH9 with 679,309 bp, we calculated the dxy and fst of ai_pcdh9 (Fig.5C.gene_pcdh9) with up and down 100 kbp, ai_pcdh9 showed diffent pattern with other regions, the SSA introgressed breeds has a lower diversity, which suggest that ai_pcdh9 was more recent than the divergence of mens sheep, which confirmed that ai_pcdh9 was introgressed into SSA breeds.
we calculated the ld of ai_pcdh9 with PCDH9, and found that the LD not decay like other regions of chr10 (Fig.5A,B.gene_pcdh9), which suggest that the ai_pcdh9 was linked with PCDH9 and maybe regulated the expression level of PCDH9.
The haplonet of ai_pcdh9 (Fig.5D.gene_pcdh9) showed that meat sheep and small sheep have two mainly haplogroup, the SSA introgressed breeds haoplogroup mainly close to small sheep haplogroup, which suggest that the ai_pcdh9 region maintain a haplotype that regulates sheep body size. The genotype heatmap of ai_pcdh9 (Fig.5E.gene_pcdh9) showed that the SSA introgressed breeds have similiar pattern with small sheep and the pattern is from two *O.orientalis*_1 samples(IROO−K7−0642, IROO−E5−5146), which is located at (49.32136E,36.721474N and 46.393425E,37.746767N; near Sahand,Iran). the exon of PCDH9 didnot show any similiar pattern (Fig.5F.gene_pcdh9), which suggest that the ai_pcdh9 region regulates the expression level of PCDH9, and impact the body size of domestic sheep.

# kk
