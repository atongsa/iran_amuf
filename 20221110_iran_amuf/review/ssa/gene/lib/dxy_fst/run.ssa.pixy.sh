#!/usr/bin/env bash

# cd
cd /public/home/d0202110815/at42/proj/iran_amuf/review/ssa/gene/dxy_fst

# args
v_f='/public/home/d0202110815/at42/proj/iran_amuf/review/ssa/d_fd/v_f/d.10.vcf.gz'

r_g='10:41104271-41313804'

op_f='cal'

pp_m='men.strata'
op_p_m='menz.ai.pixy'

pp_s='s4.strata'
op_p_s='ssa4.ai.pixy'

# v_f
bcftools view -M2 -v snps $v_f -S sel.id -i 'F_MISSING < 0.01 & MAF > 0.05' > sel.vcf

bgzip sel.vcf
tabix -p vcf sel.vcf.gz

v_f='sel.vcf.gz'

# window
bedtools makewindows -b reg.bed -w 10000 -s 2000 > cal.window

# cal
pixy --stats pi fst dxy \
--bypass_invariant_check 'yes' \
--vcf $v_f \
--populations $pp_m \
--bed_file cal.window \
--output_folder $op_f \
--output_prefix $op_p_m

pixy --stats pi fst dxy \
--bypass_invariant_check 'yes' \
--vcf $v_f \
--populations $pp_s \
--bed_file cal.window \
--output_folder $op_f \
--output_prefix $op_p_s

# kk
