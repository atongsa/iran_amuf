#!/usr/bin/env bash
#SBATCH -J o.at42_id
#SBATCH -p Cnode
#SBATCH -N 1
#SBATCH -n 1
#SBATCH -c 2
#SBATCH -t 6-14:00
#SBATCH -o %j.o
#SBATCH -e %j.e

# cd
cd /public/home/d0202110815/at42/proj/iran_sheep/mito/dep_th

# args
b_m='/public/home/d0202110815/at42/proj/win_138/atongsa/disk_g/atongsa/iran_sheep/bam_867/'

# rsync
rsync -aPv $b_m/ bam_867/ > rsync.bam.log &

# run
for f in bam_867/*
do
samtools depth -a $f | awk '{c++;s+=$3}END{print s/c}'  # mean read depth
done > mito.bam.depth

for f in bam_867/*
do
echo `basename $f`
done > mito.bam.id

# kk
