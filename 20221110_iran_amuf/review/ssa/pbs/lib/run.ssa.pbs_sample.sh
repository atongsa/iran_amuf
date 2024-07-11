#!/usr/bin/env bash

# cd
cd /public/home/d0202110815/at42/proj/iran_amuf/review/ssa/pbs

# grep
#grep -Ff pop.id id.strata > pbs.strata

# split
group_write.r pbs.strata "X2"

# kk
