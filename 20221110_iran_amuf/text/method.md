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

# Close Kinship Analyses
Given that the close relationship of samples has the potential to bias the heterozygosity, inbreeding, and genetic load results, so the kinship analyses among the collected genome sequences from the individuals for each species were performed with the Kinship-based Inference for Genome-wide association studies (KING) (Manichaikul et al., 2010) to remove the potential consanguineous individuals. Kinship coefficient was estimated with the “-kinship” command from KING v.2.2.5, which reflects the proportion of SNPs with identical state (IBS0, identity by state zero) between individuals. Negative coefficients indicate unrelated relationships, while positive coefficients indicate genealogy links between individuals. Nonconsanguineous individuals (kinship coefficients <0) were used in the subsequent analyses (Supplementary Table 1).

# ref
https://www.frontiersin.org/articles/10.3389/fgene.2020.615926/full
10.3389/fgene.2020.615926

# kk