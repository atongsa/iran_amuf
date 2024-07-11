#!/usr/bin/env bash

# cd
cd /public/home/d0202110815/at42/proj/iran_amuf/hap_net/mito/all_len/sam_ple

# run
cp /public/home/d0202110815/at42/proj/iran_amuf/phylo/mito/tree/hap_id/sp_hap.tsv .

left_join.r mt.st.strata sp_hap.tsv '"X1"' mt.st.hap.strata

# kk
