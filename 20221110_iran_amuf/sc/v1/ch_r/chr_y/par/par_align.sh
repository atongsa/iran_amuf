#!/usr/bin/env bash
#SBATCH -J o.at42_id
#SBATCH -p Cnode
#SBATCH -N 1
#SBATCH -n 1
#SBATCH -c 6
#SBATCH -t 6-14:00
#SBATCH -o %j.o
#SBATCH -e %j.e

# cd
cd /public/home/d0202110815/at42/proj/iran_sheep/y_chr/par

# select_fa
#seqkit grep -p 'X' sheep_chr_num.fna > x.chr
#seqkit grep -p 'CM022046.1' GCA_011170295.1.fna > y.chr

# args
x_chr='x.chr'
y_chr='y.chr'

# x_a
minimap2 -cx asm5 $x_chr $y_chr > par_x.paf

# y_a
minimap2 -cx asm5 $y_chr $x_chr > par_y.paf

# filter_x
cut -f6,8-12 par_x.paf | sort -k2,2n -k3,3n |\
awk '$5 > 2000 && $6 > 20' > par.x.bed
bedtools merge -d 5000000 -i par.x.bed > par.x.bed.mg
cat par.x.bed.mg | awk '{a=$3-$2; print $0"\t"a}' | awk '$4 > 1000000' > par.x.simi.bed # 20M~100M

# filter_y
cut -f6,8-12 par_y.paf | sort -k2,2n -k3,3n |\
awk '$5 > 2000 && $6 > 20' > par.y.bed
bedtools merge -d 5000000 -i par.y.bed > par.y.bed.mg
cat par.y.bed.mg | awk '{a=$3-$2; print $0"\t"a}' | awk '$4 > 1000000'

# kk
