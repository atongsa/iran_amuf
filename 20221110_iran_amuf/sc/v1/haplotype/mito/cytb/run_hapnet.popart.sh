#!/usr/bin/env bash

# cd
cd /public/home/d0202110815/at42/proj/iran_amuf/hap_net/mito/cytb/plot/popart/all

# trait
cut -f1,4- hapnet.cytb.tsv | tail -n +2 > pop.trait.tsv
cut -f1,4- hapnet.cytb.tsv | head -n 1 | sed 's/\t/ /g'

# nexus
cut -f1,3 hapnet.cytb.tsv | cut -f1 -d',' > kv.id
paste <(cut -f2 kv.id) <(cut -f1 kv.id) > kv.id2

cut -f2 kv.id > sel.id
seqkit grep -f sel.id -n ../../../fa/sel.fa > hap.fa
seqkit replace -p '(.*)' -r '{kv}' -k kv.id2 hap.fa > hap.fa.2

trimal -nexus -in hap.fa.2 -out hap.fa.2.nexus

# add_trait
BEGIN TRAITS;
[The traits block is specific to PopART. The numbers in the matrix are number of
samples associated with each trait. The order of the columns must match the
order of TraitLabels. Separator can be comma, space, or tab.]
  Dimensions NTRAITS=13;
  Format labels=yes missing=? separator=Tab;
  [Optional: if you include TraitLatitude and TraitLongitude they will be used to place trait groups on the map]
  TraitLabels Mt_HA Mt_HB Mt_HC Mt_HD Mt_HE om oo_Turkey oo.gmelini_Armenia oo.gmelini_Iran oo.gmelini_Kazakhstan oo.gmelini_UK oo.gmelini_x_vignei_Iran oo.ophion_Cyprus;
  Matrix

# cat
cat hap.fa.2.nexus <(echo -e '\n') pop.trait.txt pop.trait.tsv <(echo -e ';\nEND;\n')> pop.nexus

# kk
