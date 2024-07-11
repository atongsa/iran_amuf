#!/usr/bin/env bash

# cd
cd /public/home/d0202110815/at42/proj/iran_amuf/d_stats/pbs/sample_info

# grep
grep -Ff pop.id id.strata > pbs.strata

# split
group_write.r pbs.4.strata "X2"

# kk
