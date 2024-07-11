#!/usr/bin/env bash

# cd
cd /public/home/d0202110815/at42/proj/iran_amuf/review/ssa/pbs

# pop
run.ssa.pbs_sample.sh

# pbscan
run_pbscan.sh

# sig_pbs
run.ssa.pbs.sig.sh

# anno
run.ssa.pbs.anno_ai.sh

# manh
pbs_f='/public/home/d0202110815/at42/proj/iran_amuf/review/ssa/pbs/sig/pbs.all.tsv'
anno_f='/public/home/d0202110815/at42/proj/iran_amuf/review/ssa/pbs/anno/ai/manh/manh.anno.fake.tsv'
chr_n='26'
op_p='ssa.pbs.manh'

plot.ssa.pbs_manh.r \
$pbs_f \
$anno_f \
$chr_n \
$op_p

# kk
