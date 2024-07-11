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
We estimate the effective population sizes with 26 autosomes using SMC++ v1.15.2 [@terhorstRobustScalableInference2017]. The *O.orientalis* was split into two groups by PCA and Kmeans results, the *O.aries* was split into 6 groups (ME,CEA,SSA,ME,AFR,EUR,AME) according to structure analysis. The samples used by SMC++ were choosed with the highest bam deapth. The Beast v2.7.3 [@bouckaertBEASTAdvancedSoftware2019a] and BICEPS v1.1.1 [@bouckaertEfficientCoalescentEpoch2022] were used to construct demographic history of mitrochondrial and Y chromosome. The site model was used as GTR + gamma + I, the prior was selected as BICEPS, the colock rate was 5x10^-9 and 1x10^-10 respectively for mitrochondrial and y chromosome. We calculated the divergence time of *O.orientalis* with SSA pops with MSMC2 v2.1.4 [@wangTrackingHumanPopulation2020]. We make admixture analysis with *O.orientalis* and SSA populations with sNMF v1.2 [@frichotFastEfficientEstimation2014], with options: -c.

# results
The domographic history from SMCPP results (Fig.3A) shows that the iranian mouflon and domestic sheep had a similar history pattern, which confirm that the asian mouflon is the domestication ancestor of sheep [@sannaFirstMitogenomeCyprus2015b]. The domestic sheep effective population had a rapidly drops at 10kbp, which confirm the domestiction time of sheep [@sannaFirstMitogenomeCyprus2015b; @dengPaternalOriginsMigratory2020a]. The domestic sheep effective population reches its lowest at 8kbp, which maybe relative to the expansion from domestication centor [@demirciMitochondrialDNADiversity2013]. After 10kbp, SSA pops was seperated with other domestic sheep pops, and with some similar pattern with O.orientalis_2 group. We hypothesis that the SSA group maybe had gene flow with iranian mouflon to produce this phenomenon. To test our hypothesis, we conducted admixture analysis with iranian mouflon with SSA pops, and found the lowest cross entropy at K=3 (Fig.3E), the admxiture results shows that the iraninan mouflon splits into two groups as (Fig.1). The SSA pops was divided into three pops, by the green ancestry components, the less green pop, the none green pop and the highest green pop. According to the admixture and SMCPP results, we decides to go on testing the gene flow hypothesis between irannian mouflon and SSA pops.
We conducted the bayesian skyline analysis with mitrochondrial removed d-loop and y chromosome snps. The mitrochondrial skyline plots (Fig.3C) showed that the iranian mouflon has a rapidly increasment at about 500 kbp and keeps its population size after 200 kbp, the domestic sheep effective population has a rapidly at about 80 kbp, and reaches its highst population size at about 30 kbp. The diffent pattern bewteen iranian mouflon ans domestic sheep shows that, the iraninan mouflon is not the directly ancstor of domestic sheep.
The y SNPS skyline plots (Fid.3D) showed that the iranian mouflon has a rapidly drop of effective population size at 10 MBP, and the domestic sheep convergent to the same level from 500 KBP. The divergence of y between iranian mouflon and domestic sheep confirm that the iranian mouflon is not the ancestor of domestic sheep.

# kk
phasing strategies, SHAPEIT2

# vcf
We choose the core set of SNPs (missing less than 0.1; MAF greater than 0.01) for additional pruning. PLINK v1.90b6.26 [@chang2015] was used to remove SNPs having high LD (r2 >= 0.1) within a continuous window of 50 kbp (step size 10 kbp), which yielded 3,139,107 SNPs. We performed PCA with PLINK v1.90b6.26 [@chang2015]. The first two principal components were plotted and colored according to major breeds, location and species.

The Bayesian skyline plot (BSP) was constructed using BEAST (Drummond et al., 2005) for 67 domestic goats using Y chromosome data and mtDNA sequence separately. Before estimating, we tested whether concatenate SNPs can replace the complete sequence for BSP analysis and whether the scaffolds' orders and orientations would affect the results. Therefore, concatenate SNPs from the Y chromosome were used for BSP analysis to reduce computational complexity. To estimate goat Y chromosome mutation rate, we used the mean goat genome mutation rate of 1.3e−8 per bp per generation (Daly et al., 2018), with generation time two years, and assumed a male-to-female mutation rate ratio of 2.0 (Smeds et al., 2019) (the inferred rate was 8.67e−9 for full sequence). Next, we rescaled the mutation rate into 7.14e−6 for concatenate SNPs (Table S6). Other parameters were the same as for the phylogenetic analysis. MCMC chain length of 100,000,000 was used to ensure ESS >225. The mtDNA model parameters were set under the HKY+G substitution model, and a strict clock rate with mutation rate of 2.73e−7 (Nomura et al., 2013; Tarekegn et al., 2018) was used for Bayesian skyline analysis.
[@10.1002/ece3.7611]
