#!/usr/bin/env bash

# cd
cd /public/home/d0202110815/at42/proj/iran_amuf/gene/pixy

# args
b_d='10:41104271-41313804'  #'10:41204271-41213804'
v_f='/public/home/d0202110815/at42/proj/iran_amuf/chr_auto/miss_maf/ms01_mf001/10.ms01_mf001.vcf.gz'
op_f='cal'

p_p_m='pop/m.strata'
op_p_m='menz.ai.pixy'

p_p_s='pop/s.strata'
op_p_s='ssa.ai.pixy'

# window
bedtools makewindows -b reg.bed -w 10000 -s 2000 > cal.window

# cal
pixy --stats pi fst dxy \
--bypass_invariant_check 'yes' \
--vcf $v_f \
--populations $p_p_m \
--bed_file cal.window \
--output_folder $op_f \
--output_prefix $op_p_m

pixy --stats pi fst dxy \
--bypass_invariant_check 'yes' \
--vcf $v_f \
--populations $p_p_s \
--bed_file cal.window \
--output_folder $op_f \
--output_prefix $op_p_s

# kk
