#!/usr/bin/env bash

# cd
cd /public/home/d0202110815/at42/proj/iran_amuf/demo_graphy/chr_auto/smcpp

# vcf
cd /public/home/d0202110815/at42/proj/iran_amuf/demo_graphy/chr_auto/smcpp/v_f

v_f='sheep.810.1.bisnp.pass.vcf.gz'
bcftools view -S sel.id $v_f |\
bcftools view -i 'F_MISSING < 0.01 & MAF > 0.05' -Oz > smc.vcf.gz
tabix -p vcf smc.vcf.gz

# pop
cd /public/home/d0202110815/at42/proj/iran_amuf/demo_graphy/chr_auto/smcpp/sam_ple

group_write.r id.ls2 "X2"

for f in *tsv
do
printf ${f%.tsv}"\t"${f%.tsv}":"
cat $f | tr '\n' ',' | sed 's/,$/\n/'
done > vf2smc.pop

# estimate
run_smc_estimate.sh

# div
run_smc_div.sh

# smc_plot
plot_ssa.smcpp.csv.sh

# ggplot_plot
plot_smcpp.esti.ggplot.ssa.r # estimate
plot_smcpp.split.ggplot.ssa.r # split

# kk
