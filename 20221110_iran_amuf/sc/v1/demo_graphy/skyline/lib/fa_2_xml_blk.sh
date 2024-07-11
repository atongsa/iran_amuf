#!/usr/bin/env bash

# f
fa=$1

# fa2blk
seqkit fx2tab $fa | while read at_id at_seq
do
printf '        <sequence id="seq_at_id" spec="Sequence" taxon="at_id" totalcount="4" value="at_seq"/>'"\n" |\
sed "s/at_id/$at_id/g; s/at_seq/$at_seq/g"
done > $fa.fa_xml
#sed '$ s/\\//' $fa.fa_xml > $fa.fa_xml.2  #  # ; 1 s/  //

# kk
