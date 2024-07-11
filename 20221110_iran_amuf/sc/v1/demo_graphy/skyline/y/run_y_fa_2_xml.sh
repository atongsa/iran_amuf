#!/usr/bin/env bash

# cd
cd /public/home/d0202110815/at42/proj/iran_amuf/demo_graphy/chr_y/config

# model
cp oo.y.xml model.xml
grep -v '<sequence' model.xml > model.y.xml

# get_fa
seqkit grep -f o.HY2.id -n ram.p.min239.fasta > o.HY2.fa

# fa2blk
for f in {y1,y2}
do
seqkit fx2tab ../fa/$f.fa | while read at_id at_seq
do
printf '        <sequence id="seq_at_id" spec="Sequence" taxon="at_id" totalcount="4" value="at_seq"/>'"\n" |\
sed "s/at_id/$at_id/g; s/at_seq/$at_seq/g"
done > y.$f.fa_xml
#sed '$ s/\\//' y.$f.fa_xml > y.$f.fa_xml2  #  # ; 1 s/  //
done

# c_blk
for f in y.{y1,y2}.fa_xml
do
#t_t=`cat $f`
#sed "7i \  $t_t" model.xml > ${f%.fa_xml2}.xml
insert_block.py model.y.xml $f 6 ${f%.fa_xml}.xml
done

# kk
