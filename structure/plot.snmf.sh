#!/usr/bin/env bash

# cd
cd /public/home/d0202110815/at42/proj/iran_amuf/v2/p1/admixture

# args
## 788
q_f='/public/home/d0202110815/at42/proj/iran_amuf/v2/p1/admixture/snmf_q/788.f2.'
#pop_f='/public/home/d0202110815/gse/wgs/pops_str/mouflon.dom.f2.ped'
strata_f='/public/home/d0202110815/at42/proj/iran_amuf/v2/p1/admixture/sp_info/snmf.788.st'
lv_f='/public/home/d0202110815/at42/proj/iran_amuf/v2/p1/admixture/sp_info/sp.lv'

## amuf
q_f='/public/home/d0202110815/at42/proj/iran_amuf/v2/p1/admixture/snmf_q/mouflon.f2.'
#pop_f='/public/home/d0202110815/gse/wgs/pops_str/mouflon.dom.f2.ped'
strata_f='/public/home/d0202110815/at42/proj/iran_amuf/v2/p1/admixture/sp_info/snmf.amuf.st'
lv_f='/public/home/d0202110815/at42/proj/iran_amuf/v2/p1/admixture/sp_info/sp.lv'

## mouflon_urial
q_f='/public/home/d0202110815/at42/proj/iran_amuf/v2/p1/admixture/snmf_q/mouflon.urial.f2.'
#pop_f='/public/home/d0202110815/gse/wgs/pops_str/mouflon.dom.f2.ped'
strata_f='/public/home/d0202110815/at42/proj/iran_amuf/v2/p1/admixture/sp_info/snmf.amuf_urial.st'
lv_f='/public/home/d0202110815/at42/proj/iran_amuf/v2/p1/admixture/sp_info/sp.lv'

# run
## sort sp
awk 'BEGIN{FS="\t"; OFS="\t"} NR==FNR{a[$1]=$2; next} ($1 in a){print $1, a[$1]}' sp.strata sp.id > sp.st.strata

## cal_cv
where is the snmf log?
should cal which is the smallest cv of K.

# plot_all_k
cd /public/home/d0202110815/at42/proj/iran_amuf/v2/p1/admixture/plot_pong
plot.snmf.pong.sh

# plot_k_n; based on the results of all_k, i choose k=7/8 to plot
cd /public/home/d0202110815/at42/proj/iran_amuf/v2/p1/admixture/plot_k
plot.snmf.st.r

# kk