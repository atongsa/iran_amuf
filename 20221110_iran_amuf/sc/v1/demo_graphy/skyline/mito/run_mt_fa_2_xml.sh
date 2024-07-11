#!/usr/bin/env bash

# cd
cd /public/home/d0202110815/at42/proj/iran_amuf/demo_graphy/chr_mito/config

# model
#cp oo.y.xml model.xml
#grep -v '<sequence' model.xml > model.y.xml

# get_fa
seqkit grep -f o.HCE.id -n o.926.trim.fa > o.HCE.fa

# fa2blk
for f in {habd,hce,oo}
do
seqkit fx2tab $f.fa | while read at_id at_seq
do
printf '        <sequence id="seq_at_id" spec="Sequence" taxon="at_id" totalcount="4" value="at_seq"/>'"\n" |\
sed "s/at_id/$at_id/g; s/at_seq/$at_seq/g"
done > mt.$f.fa_xml
#sed '$ s/\\//' y.$f.fa_xml > y.$f.fa_xml2  #  # ; 1 s/  //
done

# c_blk
for f in mt.{habd,hce,oo}.fa_xml
do
#t_t=`cat $f`
#sed "7i \  $t_t" model.xml > ${f%.fa_xml2}.xml
insert_block.py model.mt.xml $f 6 ${f%.fa_xml}.xml
done

# kk
