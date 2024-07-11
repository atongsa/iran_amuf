#!/usr/bin/env bash

# cd
cd /public/home/d0202110815/at42/proj/iran_amuf/hap_net/mito/all_len/popart_loc

# args
hap_tsv='hap_net.tsv'
sel_fa='../fa/sel.st.fa'

# trait
cut -f1,4- $hap_tsv | tail -n +2 > pop.trait.tsv
cut -f1,4- $hap_tsv | head -n 1 | sed 's/\t/ /g'

# nexus
cut -f1,3 $hap_tsv | cut -f1 -d',' > kv.id
paste <(cut -f2 kv.id) <(cut -f1 kv.id) > kv.id2

cut -f2 kv.id > sel.id
seqkit grep -f sel.id -n $sel_fa > hap.fa
seqkit replace -p '(.*)' -r '{kv}' -k kv.id2 hap.fa > hap.fa.2

trimal -nexus -in hap.fa.2 -out hap.fa.2.nex

# add_trait
cat > pop.trait.txt <<EOF
BEGIN TRAITS;
[The traits block is specific to PopART. The numbers in the matrix are number of
samples associated with each trait. The order of the columns must match the
order of TraitLabels. Separator can be comma, space, or tab.]
  Dimensions NTRAITS=9;
  Format labels=yes missing=? separator=Tab;
  [Optional: if you include TraitLatitude and TraitLongitude they will be used to place trait groups on the map]
  TraitLabels O.vignei O.orientalis_1 O.orientalis_2 ME CEA SSA AFR EUR AME;
  Matrix
EOF

# cat
cat hap.fa.2.nex <(echo -e '\n') pop.trait.txt pop.trait.tsv <(echo -e ';\nEND;\n')> pop.loc.nex

# kk
