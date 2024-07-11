#!/usr/bin/env bash

# time_tree
cd /public/home/d0202110815/at42/proj/iran_amuf/review/time_tree

for f in {o.hy2,y1,y2}
do
seqkit grep -f $f.id all.nogap.trim.fa | seqkit replace -p '(^.*$)' -r "$f.\$1" > $f.fa
done

run.iran_amuf.y.timetree.sh

##combine
export PATH='/public/home/d0202110815/at42/app/beast/beast/bin':$PATH

for f in {mt,y}
do
logcombiner -o mg.$f.log \
-log ttree.$f.a.$f.time.log \
-log ttree.$f.b.$f.time.log \
-log ttree.$f.c.$f.time.log

logcombiner -o mg.$f.tree \
-log ttree.$f.a.$f.time-$f.trees \
-log ttree.$f.b.$f.time-$f.trees \
-log ttree.$f.c.$f.time-$f.trees
done 

# treeannotator
treeannotator \
-height median \
-burnin 10 \
-file ../m_g/mg.y.tree mg.y.time.tree

treeannotator \
-height median \
-burnin 10 \
-file ../m_g/mg.mt.tree mg.mt.time.tree

# figtree
(ohy2,hy2) [29501.82,54235.59]
+(hy1) [56922.70,94200.47]
+(wild) [1125827.78,1323730.76]

(oce,ce) [415909.70,534446.64]
+(abd) [718034.02,873195.49]

# kk