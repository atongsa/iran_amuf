#!/usr/bin/env bash

# cd
cd /public/home/d0202110815/at42/proj/iran_sheep/ana/mito/mito_fa/lv_867

# kv
sed 's/.MT$//' 867.id > 867.kv.id
paste 867.id 867.kv.id > kv.id

# rename
k_v='kv.id'
f_a='o.lv.867.fa'
fa_n='o.lv.867.shortname.fa'

seqkit replace -p '(^[^\s]+)*' -r '{kv}' -k $k_v $f_a >  $fa_n # sheep

# select
seqkit grep -f mito.lv.id ../$fa_n > lv.798.fa

# kk
