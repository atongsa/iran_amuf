#!/usr/bin/env bash

# auto
cd /public/home/d0202110815/at42/proj/iran_amuf/chr_auto/pk_780/pk_780
grep 'variants and 780' *log | cut -f1 -d' ' | cut -f2 -d':' | datamash sum 1
#121252917

# auto_779
cd /public/home/d0202110815/at42/proj/iran_amuf/chr_auto/pk_779/fil_ter
grep 'variants and 779' *log | cut -f1 -d' ' | cut -f2 -d':' | datamash sum 1
#25270188

# prune_779
cd /public/home/d0202110815/at42/proj/iran_amuf/chr_auto/pk_779/pru_ne
grep 'variants and 779' pr.o*log | cut -f1 -d' ' | cut -f2 -d':' | datamash sum 1
# 1,617,826

cd /public/home/d0202110815/at42/proj/iran_amuf/chr_auto/pk_779/m_g
cat iran_sheep.pr.log # 1566300

# y


# kk
