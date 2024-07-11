---
bibliography: "/home/atongsa/Documents/read/paper/zotero_cite_lib/at.csl.yaml"
csl: "cell.csl"
---

## introgression
- method
p280-281

We used Dfoil v2017-011-25 [@peaseDetectionPolarizationIntrogression2015b] (James B. Pease and Matthew W. Hahn, 2015) to infer the direction of gene flow between O. gmelini_2 and the four SSA introgression breeds (GUR/BGE/SUM/GAR). Based on the dfoil method, we choose O. gmelini_2 as P1, O. gmelini_1 as P2, the four SSA introgression breeds as P3, MEN as P4, bighorn as outgroup.

We used mvftools v0.6.2.1 (https://www.github.com/peaselab/mvftools) [@peaseEncodingDataUsing2018](Pease JB and BK Rosenzweig, 2018) to count the abba-baba pattern acrosss the 5 populations. The dfoil.py and dfoil_analyze module in Dfoil was used to calculate the D-statistics and summarise the results.

- result
p452-452

DFOIL tests support introgression from O. gmelini_1 and O. gmelini_2 into the four SSA breeds (Supplementary table dfoil.tsv, DFO = 0.823 p = 0.024, DIL = 0.393 p = 0.029, DFI = 0.596 p = 0.056, DOL = 0.137 p = 0.056; ++00 is a signature of P1 and P2 introgressed into P3).

## bsp
p226-p244

- method
Firstly, we used a coalescent model to estimate the mutation rates for mitogenome and Y chromosome chromosomes. The analysis was performed using the GTR + GAMMA (4) + I site model and the strict clock model. The most recent common ancestor (MRCA) of genus Ovis was set to be 3.2-5.4 Ma [@wangOutTibetEarly2016; @upadhyayWholeGenomeSequencing2021c]. The chain length was set to be 10,000,000 with a burn-in of 10% with three repeats running with beast v2.7.6 [@bouckaertBEASTAdvancedSoftware2019a]. The results were merged with logcombiner v2.7.6 [@bouckaertBEASTAdvancedSoftware2019a] and analyzed using Tracer (http://beast.community/tracer), assuming mutation rates estimates of 9.44 x 10-9 and 6.45 × 10-8 substitutions per site per year for the mitochondrial and Y chromosome SNPs, respectively.

Subsequently, we utilized the mutation rates estimated above to infer the demographic history of maternal and paternal lineages in domestic sheep and Asiatic mouflon. We used the same GTR + GAMMA (4) + I site model as above, with the clock model set as strict and the mutation rates of 9.44 x 10-9 and 6.45 × 10-8 substitutions per site per year for mitochondria and Y-chromosome, respectively. The prior model remained the Coalescent Bayesian Skyline, with the chain length was set to be 10,000,000 with a burn-in of 10% with three repeats. The obtained results were further analyzed using Tracer, and each analysis yielded over 200 effective samples for all relevant parameters. We also used the Yule model with same method to estimate the relative ages of diffrent haplogroups of mitochodria and Y chromosome.

- result
p391-394
Lineage A+B+D showed a steep increase in Ne at approximately ~60 k years ago. For lineage C+E, it also increased at approximately ~60 k years ago, while lineage o.HCE demonstrated relatively fewer changes since approximately ~100 k years ago (Fig. 3c). 

p397-403
Lineages o.HY2 and HY2 displayed steep decline in Ne at approximately ~10 k years ago, while lineage HY1 changed sightly since approximately ~100 k years ago and steep increased from about 1000 years ago (Fig. 3d). Thus, uniparental genetic markers showed similar demographic patterns between o.HY2 and HY2 as well as between HCE and C/E, but different patterns between the dominant linages A+B+D and HY1 (Fig. 2 and 3). The results suggested that the Asiatic mouflons in Iran might not be the direct ancestor of domestic sheep but be involved in the genetic introgression.

## structure
We used the snp from 'convergent snp paper' and found similiar structure as our datasets, which convinced that the populaiton structure of Iranian asiatic mouflon.

- timetree
# figtree
(ohy2,hy2) [29501.82,54235.59]
+(hy1) [56922.70,94200.47]
+(wild) [1125827.78,1323730.76]

(oce,ce) [415909.70,534446.64]
+(abd) [718034.02,873195.49]



# kk
https://link.springer.com/article/10.1186/s12862-018-1137-x#MOESM6

[dfoil]10.1111/mec.13602
