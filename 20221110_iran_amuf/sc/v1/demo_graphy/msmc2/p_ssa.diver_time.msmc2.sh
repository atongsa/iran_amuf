#!/usr/bin/env bash

# cd
cd /public/home/d0202110815/at42/proj/iran_amuf/demo_graphy/chr_auto/msmc2/b_m

# ln
ln -s /public/home/d0202110815/at42/proj/win_138/atongsa/disk_g/吕锋骅数据/bam_data b_p

# rsync_bam
cat ss.ls | while read b_m n_bm
do
echo $n_bm
echo $b_m.bai
echo $b_m
rsync -rvP $b_m $n_bm
rsync -rvP $b_m.bai $n_bm.bai
done

# mtools
cd /public/home/d0202110815/at42/proj/iran_amuf/demo_graphy/chr_auto/msmc2/mtools

# genome_mappability
run_mappability.sh

# pre
run_pre_mask_phase.sh

# bam2vf_mask
run_bam2vf_mask.sh

# phase
run_phase.shappit5.ref_100.sh

# ip
run_msmc2_ip.sh

# divergence_time
run_msmc2_div.sh

# div_df
run_msmc2_div_df.sh

# plot_div


# kk
