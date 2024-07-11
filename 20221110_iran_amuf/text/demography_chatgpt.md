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

# Effective population size and divergence time inference
We utilized SMC++ v1.15.2 [@terhorstRobustScalableInference2017] to estimate the effective population sizes of 26 autosomes. Prior to this analysis, the O.orientalis was partitioned into two groups based on principal component analysis (PCA) and K-means clustering, while the O.aries was partitioned into six groups (ME, CEA, SSA, ME, AFR, EUR, AME) using structure analysis. The samples utilized in the SMC++ analysis were selected based on their highest BAM depth.

Furthermore, we employed Beast v2.7.3 [@bouckaertBEASTAdvancedSoftware2019a] and BICEPS v1.1.1 [@bouckaertEfficientCoalescentEpoch2022] to construct the demographic history of the mitochondrial and Y chromosome. The site model used was GTR + gamma + I, while the prior was chosen as BICEPS. The clock rate was set at 5x10^-9 and 1x10^-10 for the mitochondrial and Y chromosome, respectively.

We also estimated the divergence time between O.orientalis and SSA populations using MSMC2 v2.1.4 [@wangTrackingHumanPopulation2020]. Furthermore, we conducted admixture analysis between O.orientalis and SSA populations using sNMF v1.2 [@frichotFastEfficientEstimation2014]. For this analysis, we utilized the -c option.

# results
The demographic history inferred from SMC++ results (Fig.3A) reveals that the Iranian mouflon and domestic sheep share a similar historical pattern, confirming the Asian mouflon as the ancestor of sheep [@sannaFirstMitogenomeCyprus2015b]. The effective population of domestic sheep experienced a rapid decline at 10 kbp, which coincides with the domestication time of sheep [@sannaFirstMitogenomeCyprus2015b; @dengPaternalOriginsMigratory2020a]. The effective population of domestic sheep reached its lowest point at 8 kbp, which may be associated with the expansion from the domestication center [@demirciMitochondrialDNADiversity2013]. After 10 kbp, the SSA population separated from other domestic sheep populations, with a similar pattern to that of the O.orientalis_2 group. We hypothesize that this phenomenon may be the result of gene flow between the SSA group and the Iranian mouflon. To test our hypothesis, we conducted admixture analysis between the Iranian mouflon and SSA populations and found the lowest cross-entropy at K=3 (Fig.3E). The admixture results show that the Iranian mouflon splits into two groups (Fig.1), while the SSA population is divided into three populations based on the green ancestry component, which includes the less green, none green, and highest green populations. Based on the admixture and SMC++ results, we decided to test the gene flow hypothesis between the Iranian mouflon and SSA populations.

We conducted Bayesian skyline analysis using mitochondrial removed d-loop and Y chromosome SNPs. The mitochondrial skyline plots (Fig.3C) indicate that the Iranian mouflon experienced a rapid increase at approximately 500 kbp and maintained its population size after 200 kbp. In contrast, the effective population of domestic sheep rapidly increased at approximately 80 kbp and reached its highest population size at approximately 30 kbp. The different patterns observed between the Iranian mouflon and domestic sheep suggest that the Iranian mouflon is not the direct ancestor of domestic sheep.

The Y SNP skyline plots (Fig.3D) show that the effective population size of the Iranian mouflon rapidly decreased at 10 MBP, while domestic sheep converged to the same level from 500 KBP. The divergence of Y between the Iranian mouflon and domestic sheep confirms that the Iranian mouflon is not the ancestor of domestic sheep.

# kk
phasing strategies, SHAPEIT2

# vcf
We choose the core set of SNPs (missing less than 0.1; MAF greater than 0.01) for additional pruning. PLINK v1.90b6.26 [@chang2015] was used to remove SNPs having high LD (r2 >= 0.1) within a continuous window of 50 kbp (step size 10 kbp), which yielded 3,139,107 SNPs. We performed PCA with PLINK v1.90b6.26 [@chang2015]. The first two principal components were plotted and colored according to major breeds, location and species.
