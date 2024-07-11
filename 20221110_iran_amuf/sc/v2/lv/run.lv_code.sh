#!/usr/bin/env bash

OGA009  ERR12389568 /vol1/fastq/ERR123/068/ERR12389568/ERR12389568_1.fastq.gz
OGA014  ERR12389569 /vol1/fastq/ERR123/069/ERR12389569/ERR12389569_1.fastq.gz
oga018  ERR12389570 /vol1/fastq/ERR123/070/ERR12389570/ERR12389570_1.fastq.gz
oga018_lib2 ERR12389571 /vol1/fastq/ERR123/071/ERR12389571/ERR12389571_1.fastq.gz
oga018_lib3 ERR12389572 /vol1/fastq/ERR123/072/ERR12389572/ERR12389572_1.fastq.gz
OGA021  ERR12389573 /vol1/fastq/ERR123/073/ERR12389573/ERR12389573_1.fastq.gz
OGA022  ERR12389574 /vol1/fastq/ERR123/074/ERR12389574/ERR12389574_1.fastq.gz






cym013      ERR12389567 /vol1/fastq/ERR123/067/ERR12389567/ERR12389567_1.fastq.gz
cym012      ERR12389566 /vol1/fastq/ERR123/066/ERR12389566/ERR12389566_1.fastq.gz
cym011|cym012 Identical Twin      ERR12389565 /vol1/fastq/ERR123/065/ERR12389565/ERR12389565_1.fastq.gz
cym009      ERR12389564 /vol1/fastq/ERR123/064/ERR12389564/ERR12389564_1.fastq.gz
cym008_lib2 ERR12389563 /vol1/fastq/ERR123/063/ERR12389563/ERR12389563_1.fastq.gz
cym008      ERR12389562 /vol1/fastq/ERR123/062/ERR12389562/ERR12389562_1.fastq.gz
cym007      ERR12389561 /vol1/fastq/ERR123/061/ERR12389561/ERR12389561_1.fastq.gz
cym006|cym008 Second Degree     ERR12389560 /vol1/fastq/ERR123/060/ERR12389560/ERR12389560_1.fastq.gz
cym004      ERR12389559 /vol1/fastq/ERR123/059/ERR12389559/ERR12389559_1.fastq.gz
cym003      ERR12389558 /vol1/fastq/ERR123/058/ERR12389558/ERR12389558_1.fastq.gz
cym002      ERR12389557 /vol1/fastq/ERR123/057/ERR12389557/ERR12389557_1.fastq.gz


k_y='../.aspera/connect/etc/asperaweb_id_dsa.openssh'
s_r='/vol1/fastq/ERR123/057/ERR12389557/ERR12389557_2.fastq.gz'
ascp -QT -l 300m -P33001 -k 1 -i $k_y era-fasp@fasp.sra.ebi.ac.uk:$s_r .


##------------------------------------------------Trimmomatic-0.36------------------------------------------------
## Trim所有的fastq文件
## Trimmomatic-0.36
## /public/home/2020024/GSE



#!/bin/bash
#SBATCH -J ERR12389568
#SBATCH -p Cnode
#SBATCH -t 7-00:00
#SBATCH -N 1
#SBATCH -n 4
#SBATCH -o /public/home/2020024/GSE/scripts/ERR12389568
#SBATCH -e /public/home/2020024/GSE/scripts/ERR12389568
date
Trimmomatic=/public/home/2020024/software/Trimmomatic-0.36/trimmomatic-0.36.jar
adapter=/public/home/2020024/software/Trimmomatic-0.36/adapters
path=/public/home/2020024/GSE
clean_fastq=/public/home/2020024/GSE
unpaired_fastq=/public/home/2020024/GSE
java -jar $Trimmomatic PE -phred33 $path/ERR12389568_1.fastq.gz $path/ERR12389568_2.fastq.gz $clean_fastq/C_ERR12389568_1.fastq.gz $unpaired_fastq/L_ERR12389568_1.fastq.gz $clean_fastq/C_ERR12389568_2.fastq.gz $unpaired_fastq/L_ERR12389568_2.fastq.gz ILLUMINACLIP:$adapter/TruSeq3-PE.fa:2:30:10:1:TRUE LEADING:20 TRAILING:20 SLIDINGWINDOW:4:15 -threads 4 MINLEN:50
date

#!/bin/bash
#SBATCH -J ERR12389570
#SBATCH -p Cnode
#SBATCH -t 7-00:00
#SBATCH -N 1
#SBATCH -n 4
#SBATCH -o /public/home/2020024/GSE/scripts/ERR12389570.o
#SBATCH -e /public/home/2020024/GSE/scripts/ERR12389570.e
date
Trimmomatic=/public/home/2020024/software/Trimmomatic-0.36/trimmomatic-0.36.jar
adapter=/public/home/2020024/software/Trimmomatic-0.36/adapters
path=/public/home/2020024/GSE
clean_fastq=/public/home/2020024/GSE
unpaired_fastq=/public/home/2020024/GSE
java -jar $Trimmomatic PE -phred33 $path/ERR12389570_1.fastq.gz $path/ERR12389570_2.fastq.gz $clean_fastq/C_ERR12389570_1.fastq.gz $unpaired_fastq/L_ERR12389570_1.fastq.gz $clean_fastq/C_ERR12389570_2.fastq.gz $unpaired_fastq/L_ERR12389570_2.fastq.gz ILLUMINACLIP:$adapter/TruSeq3-PE.fa:2:30:10:1:TRUE LEADING:20 TRAILING:20 SLIDINGWINDOW:4:15 -threads 4 MINLEN:50
date


#!/bin/bash
#SBATCH -J ERR12389571
#SBATCH -p Cnode
#SBATCH -t 7-00:00
#SBATCH -N 1
#SBATCH -n 4
#SBATCH -o /public/home/2020024/GSE/scripts/ERR12389571.o
#SBATCH -e /public/home/2020024/GSE/scripts/ERR12389571.e
date
Trimmomatic=/public/home/2020024/software/Trimmomatic-0.36/trimmomatic-0.36.jar
adapter=/public/home/2020024/software/Trimmomatic-0.36/adapters
path=/public/home/2020024/GSE
clean_fastq=/public/home/2020024/GSE
unpaired_fastq=/public/home/2020024/GSE
java -jar $Trimmomatic PE -phred33 $path/ERR12389571_1.fastq.gz $path/ERR12389571_2.fastq.gz $clean_fastq/C_ERR12389571_1.fastq.gz $unpaired_fastq/L_ERR12389571_1.fastq.gz $clean_fastq/C_ERR12389571_2.fastq.gz $unpaired_fastq/L_ERR12389571_2.fastq.gz ILLUMINACLIP:$adapter/TruSeq3-PE.fa:2:30:10:1:TRUE LEADING:20 TRAILING:20 SLIDINGWINDOW:4:15 -threads 4 MINLEN:50
date

#!/bin/bash
#SBATCH -J ERR12389572
#SBATCH -p Cnode
#SBATCH -t 7-00:00
#SBATCH -N 1
#SBATCH -n 4
#SBATCH -o /public/home/2020024/GSE/scripts/ERR12389572.o
#SBATCH -e /public/home/2020024/GSE/scripts/ERR12389572.e
date
Trimmomatic=/public/home/2020024/software/Trimmomatic-0.36/trimmomatic-0.36.jar
adapter=/public/home/2020024/software/Trimmomatic-0.36/adapters
path=/public/home/2020024/GSE
clean_fastq=/public/home/2020024/GSE
unpaired_fastq=/public/home/2020024/GSE
java -jar $Trimmomatic PE -phred33 $path/ERR12389572_1.fastq.gz $path/ERR12389572_2.fastq.gz $clean_fastq/C_ERR12389572_1.fastq.gz $unpaired_fastq/L_ERR12389572_1.fastq.gz $clean_fastq/C_ERR12389572_2.fastq.gz $unpaired_fastq/L_ERR12389572_2.fastq.gz ILLUMINACLIP:$adapter/TruSeq3-PE.fa:2:30:10:1:TRUE LEADING:20 TRAILING:20 SLIDINGWINDOW:4:15 -threads 4 MINLEN:50
date

#!/bin/bash
#SBATCH -J ERR12389573
#SBATCH -p Cnode
#SBATCH -t 7-00:00
#SBATCH -N 1
#SBATCH -n 4
#SBATCH -o /public/home/2020024/GSE/scripts/ERR12389573.o
#SBATCH -e /public/home/2020024/GSE/scripts/ERR12389573.e
date
Trimmomatic=/public/home/2020024/software/Trimmomatic-0.36/trimmomatic-0.36.jar
adapter=/public/home/2020024/software/Trimmomatic-0.36/adapters
path=/public/home/2020024/GSE
clean_fastq=/public/home/2020024/GSE
unpaired_fastq=/public/home/2020024/GSE
java -jar $Trimmomatic PE -phred33 $path/ERR12389573_1.fastq.gz $path/ERR12389573_2.fastq.gz $clean_fastq/C_ERR12389573_1.fastq.gz $unpaired_fastq/L_ERR12389573_1.fastq.gz $clean_fastq/C_ERR12389573_2.fastq.gz $unpaired_fastq/L_ERR12389573_2.fastq.gz ILLUMINACLIP:$adapter/TruSeq3-PE.fa:2:30:10:1:TRUE LEADING:20 TRAILING:20 SLIDINGWINDOW:4:15 -threads 4 MINLEN:50
date

#!/bin/bash
#SBATCH -J ERR12389574
#SBATCH -p Cnode
#SBATCH -t 7-00:00
#SBATCH -N 1
#SBATCH -n 4
#SBATCH -o /public/home/2020024/GSE/scripts/ERR12389574.o
#SBATCH -e /public/home/2020024/GSE/scripts/ERR12389574.e
date
Trimmomatic=/public/home/2020024/software/Trimmomatic-0.36/trimmomatic-0.36.jar
adapter=/public/home/2020024/software/Trimmomatic-0.36/adapters
path=/public/home/2020024/GSE
clean_fastq=/public/home/2020024/GSE
unpaired_fastq=/public/home/2020024/GSE
java -jar $Trimmomatic PE -phred33 $path/ERR12389574_1.fastq.gz $path/ERR12389574_2.fastq.gz $clean_fastq/C_ERR12389574_1.fastq.gz $unpaired_fastq/L_ERR12389574_1.fastq.gz $clean_fastq/C_ERR12389574_2.fastq.gz $unpaired_fastq/L_ERR12389574_2.fastq.gz ILLUMINACLIP:$adapter/TruSeq3-PE.fa:2:30:10:1:TRUE LEADING:20 TRAILING:20 SLIDINGWINDOW:4:15 -threads 4 MINLEN:50
date

#!/bin/bash
#SBATCH -J ERR12389557
#SBATCH -p Cnode
#SBATCH -t 7-00:00
#SBATCH -N 1
#SBATCH -n 4
#SBATCH -o /public/home/2020024/GSE/scripts/ERR12389557.o
#SBATCH -e /public/home/2020024/GSE/scripts/ERR12389557.e
date
Trimmomatic=/public/home/2020024/software/Trimmomatic-0.36/trimmomatic-0.36.jar
adapter=/public/home/2020024/software/Trimmomatic-0.36/adapters
path=/public/home/2020024/GSE
clean_fastq=/public/home/2020024/GSE
unpaired_fastq=/public/home/2020024/GSE
java -jar $Trimmomatic PE -phred33 $path/ERR12389557_1.fastq.gz $path/ERR12389557_2.fastq.gz $clean_fastq/C_ERR12389557_1.fastq.gz $unpaired_fastq/L_ERR12389557_1.fastq.gz $clean_fastq/C_ERR12389557_2.fastq.gz $unpaired_fastq/L_ERR12389557_2.fastq.gz ILLUMINACLIP:$adapter/TruSeq3-PE.fa:2:30:10:1:TRUE LEADING:20 TRAILING:20 SLIDINGWINDOW:4:15 -threads 4 MINLEN:50
date

#!/bin/bash
#SBATCH -J ERR12389558
#SBATCH -p Cnode
#SBATCH -t 7-00:00
#SBATCH -N 1
#SBATCH -n 4
#SBATCH -o /public/home/2020024/GSE/scripts/ERR12389558.o
#SBATCH -e /public/home/2020024/GSE/scripts/ERR12389558.e
date
Trimmomatic=/public/home/2020024/software/Trimmomatic-0.36/trimmomatic-0.36.jar
adapter=/public/home/2020024/software/Trimmomatic-0.36/adapters
path=/public/home/2020024/GSE
clean_fastq=/public/home/2020024/GSE
unpaired_fastq=/public/home/2020024/GSE
java -jar $Trimmomatic PE -phred33 $path/ERR12389558_1.fastq.gz $path/ERR12389558_2.fastq.gz $clean_fastq/C_ERR12389558_1.fastq.gz $unpaired_fastq/L_ERR12389558_1.fastq.gz $clean_fastq/C_ERR12389558_2.fastq.gz $unpaired_fastq/L_ERR12389558_2.fastq.gz ILLUMINACLIP:$adapter/TruSeq3-PE.fa:2:30:10:1:TRUE LEADING:20 TRAILING:20 SLIDINGWINDOW:4:15 -threads 4 MINLEN:50
date


#!/bin/bash
#SBATCH -J ERR12389559
#SBATCH -p Cnode
#SBATCH -t 7-00:00
#SBATCH -N 1
#SBATCH -n 4
#SBATCH -o /public/home/2020024/GSE/scripts/ERR12389559.o
#SBATCH -e /public/home/2020024/GSE/scripts/ERR12389559.e
date
Trimmomatic=/public/home/2020024/software/Trimmomatic-0.36/trimmomatic-0.36.jar
adapter=/public/home/2020024/software/Trimmomatic-0.36/adapters
path=/public/home/2020024/GSE
clean_fastq=/public/home/2020024/GSE
unpaired_fastq=/public/home/2020024/GSE
java -jar $Trimmomatic PE -phred33 $path/ERR12389559_1.fastq.gz $path/ERR12389559_2.fastq.gz $clean_fastq/C_ERR12389559_1.fastq.gz $unpaired_fastq/L_ERR12389559_1.fastq.gz $clean_fastq/C_ERR12389559_2.fastq.gz $unpaired_fastq/L_ERR12389559_2.fastq.gz ILLUMINACLIP:$adapter/TruSeq3-PE.fa:2:30:10:1:TRUE LEADING:20 TRAILING:20 SLIDINGWINDOW:4:15 -threads 4 MINLEN:50
date


#!/bin/bash
#SBATCH -J ERR12389560
#SBATCH -p Cnode
#SBATCH -t 7-00:00
#SBATCH -N 1
#SBATCH -n 4
#SBATCH -o /public/home/2020024/GSE/scripts/ERR12389560.o
#SBATCH -e /public/home/2020024/GSE/scripts/ERR12389560.e
date
Trimmomatic=/public/home/2020024/software/Trimmomatic-0.36/trimmomatic-0.36.jar
adapter=/public/home/2020024/software/Trimmomatic-0.36/adapters
path=/public/home/2020024/GSE
clean_fastq=/public/home/2020024/GSE
unpaired_fastq=/public/home/2020024/GSE
java -jar $Trimmomatic PE -phred33 $path/ERR12389560_1.fastq.gz $path/ERR12389560_2.fastq.gz $clean_fastq/C_ERR12389560_1.fastq.gz $unpaired_fastq/L_ERR12389560_1.fastq.gz $clean_fastq/C_ERR12389560_2.fastq.gz $unpaired_fastq/L_ERR12389560_2.fastq.gz ILLUMINACLIP:$adapter/TruSeq3-PE.fa:2:30:10:1:TRUE LEADING:20 TRAILING:20 SLIDINGWINDOW:4:15 -threads 4 MINLEN:50
date


#!/bin/bash
#SBATCH -J ERR12389561
#SBATCH -p Cnode
#SBATCH -t 7-00:00
#SBATCH -N 1
#SBATCH -n 4
#SBATCH -o /public/home/2020024/GSE/scripts/ERR12389561.o
#SBATCH -e /public/home/2020024/GSE/scripts/ERR12389561.e
date
Trimmomatic=/public/home/2020024/software/Trimmomatic-0.36/trimmomatic-0.36.jar
adapter=/public/home/2020024/software/Trimmomatic-0.36/adapters
path=/public/home/2020024/GSE
clean_fastq=/public/home/2020024/GSE
unpaired_fastq=/public/home/2020024/GSE
java -jar $Trimmomatic PE -phred33 $path/ERR12389561_1.fastq.gz $path/ERR12389561_2.fastq.gz $clean_fastq/C_ERR12389561_1.fastq.gz $unpaired_fastq/L_ERR12389561_1.fastq.gz $clean_fastq/C_ERR12389561_2.fastq.gz $unpaired_fastq/L_ERR12389561_2.fastq.gz ILLUMINACLIP:$adapter/TruSeq3-PE.fa:2:30:10:1:TRUE LEADING:20 TRAILING:20 SLIDINGWINDOW:4:15 -threads 4 MINLEN:50
date


#!/bin/bash
#SBATCH -J ERR12389562
#SBATCH -p Cnode
#SBATCH -t 7-00:00
#SBATCH -N 1
#SBATCH -n 4
#SBATCH -o /public/home/2020024/GSE/scripts/ERR12389562.o
#SBATCH -e /public/home/2020024/GSE/scripts/ERR12389562.e
date
Trimmomatic=/public/home/2020024/software/Trimmomatic-0.36/trimmomatic-0.36.jar
adapter=/public/home/2020024/software/Trimmomatic-0.36/adapters
path=/public/home/2020024/GSE
clean_fastq=/public/home/2020024/GSE
unpaired_fastq=/public/home/2020024/GSE
java -jar $Trimmomatic PE -phred33 $path/ERR12389562_1.fastq.gz $path/ERR12389562_2.fastq.gz $clean_fastq/C_ERR12389562_1.fastq.gz $unpaired_fastq/L_ERR12389562_1.fastq.gz $clean_fastq/C_ERR12389562_2.fastq.gz $unpaired_fastq/L_ERR12389562_2.fastq.gz ILLUMINACLIP:$adapter/TruSeq3-PE.fa:2:30:10:1:TRUE LEADING:20 TRAILING:20 SLIDINGWINDOW:4:15 -threads 4 MINLEN:50
date


#!/bin/bash
#SBATCH -J ERR12389563
#SBATCH -p Cnode
#SBATCH -t 7-00:00
#SBATCH -N 1
#SBATCH -n 4
#SBATCH -o /public/home/2020024/GSE/scripts/ERR12389563.o
#SBATCH -e /public/home/2020024/GSE/scripts/ERR12389563.e
date
Trimmomatic=/public/home/2020024/software/Trimmomatic-0.36/trimmomatic-0.36.jar
adapter=/public/home/2020024/software/Trimmomatic-0.36/adapters
path=/public/home/2020024/GSE
clean_fastq=/public/home/2020024/GSE
unpaired_fastq=/public/home/2020024/GSE
java -jar $Trimmomatic PE -phred33 $path/ERR12389563_1.fastq.gz $path/ERR12389563_2.fastq.gz $clean_fastq/C_ERR12389563_1.fastq.gz $unpaired_fastq/L_ERR12389563_1.fastq.gz $clean_fastq/C_ERR12389563_2.fastq.gz $unpaired_fastq/L_ERR12389563_2.fastq.gz ILLUMINACLIP:$adapter/TruSeq3-PE.fa:2:30:10:1:TRUE LEADING:20 TRAILING:20 SLIDINGWINDOW:4:15 -threads 4 MINLEN:50
date


#!/bin/bash
#SBATCH -J ERR12389564
#SBATCH -p Cnode
#SBATCH -t 7-00:00
#SBATCH -N 1
#SBATCH -n 4
#SBATCH -o /public/home/2020024/GSE/scripts/ERR12389564.o
#SBATCH -e /public/home/2020024/GSE/scripts/ERR12389564.e
date
Trimmomatic=/public/home/2020024/software/Trimmomatic-0.36/trimmomatic-0.36.jar
adapter=/public/home/2020024/software/Trimmomatic-0.36/adapters
path=/public/home/2020024/GSE
clean_fastq=/public/home/2020024/GSE
unpaired_fastq=/public/home/2020024/GSE
java -jar $Trimmomatic PE -phred33 $path/ERR12389564_1.fastq.gz $path/ERR12389564_2.fastq.gz $clean_fastq/C_ERR12389564_1.fastq.gz $unpaired_fastq/L_ERR12389564_1.fastq.gz $clean_fastq/C_ERR12389564_2.fastq.gz $unpaired_fastq/L_ERR12389564_2.fastq.gz ILLUMINACLIP:$adapter/TruSeq3-PE.fa:2:30:10:1:TRUE LEADING:20 TRAILING:20 SLIDINGWINDOW:4:15 -threads 4 MINLEN:50
date


#!/bin/bash
#SBATCH -J ERR12389565
#SBATCH -p Cnode
#SBATCH -t 7-00:00
#SBATCH -N 1
#SBATCH -n 4
#SBATCH -o /public/home/2020024/GSE/scripts/ERR12389565.o
#SBATCH -e /public/home/2020024/GSE/scripts/ERR12389565.e
date
Trimmomatic=/public/home/2020024/software/Trimmomatic-0.36/trimmomatic-0.36.jar
adapter=/public/home/2020024/software/Trimmomatic-0.36/adapters
path=/public/home/2020024/GSE
clean_fastq=/public/home/2020024/GSE
unpaired_fastq=/public/home/2020024/GSE
java -jar $Trimmomatic PE -phred33 $path/ERR12389565_1.fastq.gz $path/ERR12389565_2.fastq.gz $clean_fastq/C_ERR12389565_1.fastq.gz $unpaired_fastq/L_ERR12389565_1.fastq.gz $clean_fastq/C_ERR12389565_2.fastq.gz $unpaired_fastq/L_ERR12389565_2.fastq.gz ILLUMINACLIP:$adapter/TruSeq3-PE.fa:2:30:10:1:TRUE LEADING:20 TRAILING:20 SLIDINGWINDOW:4:15 -threads 4 MINLEN:50
date


#!/bin/bash
#SBATCH -J ERR12389566
#SBATCH -p Cnode
#SBATCH -t 7-00:00
#SBATCH -N 1
#SBATCH -n 4
#SBATCH -o /public/home/2020024/GSE/scripts/ERR12389566.o
#SBATCH -e /public/home/2020024/GSE/scripts/ERR12389566.e
date
Trimmomatic=/public/home/2020024/software/Trimmomatic-0.36/trimmomatic-0.36.jar
adapter=/public/home/2020024/software/Trimmomatic-0.36/adapters
path=/public/home/2020024/GSE
clean_fastq=/public/home/2020024/GSE
unpaired_fastq=/public/home/2020024/GSE
java -jar $Trimmomatic PE -phred33 $path/ERR12389566_1.fastq.gz $path/ERR12389566_2.fastq.gz $clean_fastq/C_ERR12389566_1.fastq.gz $unpaired_fastq/L_ERR12389566_1.fastq.gz $clean_fastq/C_ERR12389566_2.fastq.gz $unpaired_fastq/L_ERR12389566_2.fastq.gz ILLUMINACLIP:$adapter/TruSeq3-PE.fa:2:30:10:1:TRUE LEADING:20 TRAILING:20 SLIDINGWINDOW:4:15 -threads 4 MINLEN:50
date


#!/bin/bash
#SBATCH -J ERR12389567
#SBATCH -p Cnode
#SBATCH -t 7-00:00
#SBATCH -N 1
#SBATCH -n 4
#SBATCH -o /public/home/2020024/GSE/scripts/ERR12389567.o
#SBATCH -e /public/home/2020024/GSE/scripts/ERR12389567.e
date
Trimmomatic=/public/home/2020024/software/Trimmomatic-0.36/trimmomatic-0.36.jar
adapter=/public/home/2020024/software/Trimmomatic-0.36/adapters
path=/public/home/2020024/GSE
clean_fastq=/public/home/2020024/GSE
unpaired_fastq=/public/home/2020024/GSE
java -jar $Trimmomatic PE -phred33 $path/ERR12389567_1.fastq.gz $path/ERR12389567_2.fastq.gz $clean_fastq/C_ERR12389567_1.fastq.gz $unpaired_fastq/L_ERR12389567_1.fastq.gz $clean_fastq/C_ERR12389567_2.fastq.gz $unpaired_fastq/L_ERR12389567_2.fastq.gz ILLUMINACLIP:$adapter/TruSeq3-PE.fa:2:30:10:1:TRUE LEADING:20 TRAILING:20 SLIDINGWINDOW:4:15 -threads 4 MINLEN:50
date




##------------------------------------------------Trimmomatic-0.36------------------------------------------------


cat /public/home/2020024/GSE/ind.list | while read i
do
echo '#!/bin/bash' >> B_$i.sh
echo '#SBATCH -J '$i'' >> B_$i.sh
echo "#SBATCH -p Cnode2" >> B_$i.sh
echo "#SBATCH -t 7-00:00" >> B_$i.sh
echo "#SBATCH -N 1" >> B_$i.sh
echo "#SBATCH -n 10" >> B_$i.sh
echo '#SBATCH -o /public/home/2020024/GSE/scripts/B_'$i'' >> B_$i.sh
echo '#SBATCH -e /public/home/2020024/GSE/scripts/B_'$i'' >> B_$i.sh
echo "date" >> B_$i.sh
echo "bam=/public/home/2020024/software/bwa/" >> B_$i.sh
echo "samtools=/public/home/2020024/software/samtools-1.17/" >> B_$i.sh
echo "gatk=/public/home/2020024/software/gatk-4.2.3.0/" >> B_$i.sh
echo "ref=/public/home/2020024/reference" >> B_$i.sh
echo "clean_fastq=/public/home/2020024/GSE/" >> B_$i.sh
echo "bamfile=/public/home/2020024/GSE/" >> B_$i.sh
echo '$bam/bwa mem -1 -t 10 -k 32 -M -R "@RG\tID:'${i}'\tSM:'${i}'\tLB:lib\tPL:illumina" $ref/Oar_rambouillet.fa $clean_fastq/C_'${i}'_1.fastq.gz $clean_fastq/C_'${i}'_2.fastq.gz | $samtools/samtools view -@ 10 -bS -F 4 -f 0x2 -t $ref/Oar_rambouillet.fa.fai -o $bamfile/'${i}'.T1.bam'  >> B_$i.sh
echo '$gatk/gatk --java-options "-Xmx30G -XX:+UseParallelGC -XX:ParallelGCThreads=10" SortSam --INPUT $bamfile/'${i}'.T1.bam -OUTPUT $bamfile/'${i}'.T2.bam --SORT_ORDER coordinate' >> B_$i.sh
echo '$gatk/gatk --java-options "-Xmx30G -XX:+UseParallelGC -XX:ParallelGCThreads=10" MarkDuplicates --INPUT $bamfile/'${i}'.T2.bam -M $bamfile/'${i}'.marked_dup_metrics.txt --OUTPUT $bamfile/'${i}'.duplicate.bam' >> B_$i.sh
echo 'rm $bamfile/'${i}'.T1.bam' >> B_$i.sh
echo 'rm $bamfile/'${i}'.T2.bam' >> B_$i.sh
echo "date" >> B_$i.sh
done

## oga018.T1.bam 是将oga018_lib2 oga018_lib3两个库合并后的结果
## cym008.T1.bam 是将ocym008_lib2 cym008两个库合并后的结果



##-------------------------------------------------------------------------------------------------------##
## statistics for bam files
## mapping rates
## depth
## coverage
## 

cat /public/home/2020024/GSE/ind.list | while read i
do
echo '#!/bin/bash' >> Bam_Stat_$i.job
echo '#SBATCH -J 'Stat_$i'' >> Bam_Stat_$i.job
echo "#SBATCH -p Cnode2" >> Bam_Stat_$i.job
echo "#SBATCH -t 7-00:00" >> Bam_Stat_$i.job
echo "#SBATCH -N 1" >> Bam_Stat_$i.job
echo "#SBATCH -n 1" >> Bam_Stat_$i.job
echo '#SBATCH -o /public/home/2020024/GSE/scripts/S.'$i'.o' >> Bam_Stat_$i.job
echo '#SBATCH -e /public/home/2020024/GSE/scripts/S.'$i'.e' >> Bam_Stat_$i.job
echo "date" >> Bam_Stat_$i.job
echo "/public/home/2020024/software/samtools-1.17/samtools flagstat /public/home/2020024/GSE/${i}.duplicate.bam > /public/home/2020024/GSE/${i}_mp.txt ">> Bam_Stat_$i.job 
echo "/public/home/2020024/software/samtools-1.17/samtools depth -a /public/home/2020024/GSE/${i}.duplicate.bam | awk '{c++;s+=\$3}END{print s/c}'  > /public/home/2020024/GSE/${i}_dep.txt" >> Bam_Stat_$i.job
echo "/public/home/2020024/software/samtools-1.17/samtools depth -a /public/home/2020024/GSE/${i}.duplicate.bam | awk '{c++; if(\$3>0) total+=1}END{print (total/c)*100}' > /public/home/2020024/GSE/${i}_cov.txt " >> Bam_Stat_$i.job
echo "date" >> Bam_Stat_$i.job
done

cat /public/home/2020024/GSE/ind.list | while read i
do
sbatch Bam_Stat_$i.job
done 

ls *_dep.txt | while read file_name;
 do
    # 用.为分隔符只要文件名，去掉文件后缀
    echo -n "${file_name%.*}: " >> W.stat_depth.txt
    cat "$file_name" >> W.stat_depth.txt
    echo "" >> W.stat_depth.txt
 done
 



##-------------------------------------------------------------------------------------------------------##
## Depth of coverage lower than 100
## Filter

## step1

cat /public/home/2020024/GSE/ind.list | while read i
 do
   echo '#!/bin/bash' >>  1.mt_$i.job
   echo '#SBATCH -J '$i'' >>  1.mt_$i.job
   echo "#SBATCH -p Cnode2" >>  1.mt_$i.job
   echo "#SBATCH -t 7-00:00" >> 1.mt_$i.job
   echo "#SBATCH -N 1" >> 1.mt_$i.job
   echo "#SBATCH -n 1" >> 1.mt_$i.job
   echo '#SBATCH -o /public/home/2020024/GSE/scripts/M.'$i'.o' >> 1.mt_$i.job
   echo '#SBATCH -e /public/home/2020024/GSE/scripts/M.'$i'.o' >> 1.mt_$i.job
   echo "date" >>  1.mt_$i.job
   echo "/public/home/2020024/software/samtools-1.17/samtools index /public/home/2020024/GSE/${i}.duplicate.bam " >> 1.mt_$i.job
   echo "/public/home/2020024/software/samtools-1.17/samtools view -b /public/home/2020024/GSE/${i}.duplicate.bam M -> /public/home/2020024/GSE/${i}_MT.bam" >> 1.mt_$i.job
   echo "/public/home/2020024/software/samtools-1.17/samtools depth /public/home/2020024/GSE/${i}_MT.bam | awk '{c++;s+=\$3}END{print s/c}' > /public/home/2020024/GSE/${i}_MT_dep.txt" >> 1.mt_$i.job
   echo "date" >> 1.mt_$i.job
 done


ls *MT_dep.txt | while read file_name;
 do
    # 用.为分隔符只要文件名，去掉文件后缀
    echo -n "${file_name%.*}: " >> M.stat_depth.txt
    cat "$file_name" >> M.stat_depth.txt
    echo "" >> M.stat_depth.txt
 done
 
 
##-------------------------------------------------------------------------------------------------------##
 
cat /public/home/2020024/GSE/ind.list | while read i
 do
   echo '#!/bin/bash' >>  2.mt_$i.job
   echo '#SBATCH -J '$i'' >>  2.mt_$i.job
   echo "#SBATCH -p Cnode2" >>  2.mt_$i.job
   echo "#SBATCH -t 1-00:00" >> 2.mt_$i.job
   echo "#SBATCH -N 1" >> 2.mt_$i.job
   echo "#SBATCH -n 1" >> 2.mt_$i.job
   echo '#SBATCH -o /public/home/2020024/GSE/scripts/2.M.'$i'.o' >> 2.mt_$i.job
   echo '#SBATCH -e /public/home/2020024/GSE/scripts/2.M.'$i'.e' >> 2.mt_$i.job
   echo '/public/home/2020024/software/samtools-1.17/samtools view /public/home/2020024/GSE/mit_bam/'${i}'_MT.bam | 'awk "'"'{OFS="\t"; print ">"$1"\n"$10}'"'"' -> /public/home/2020024/GSE/mit_bam/'${i%.d*}'_MT.fasta' >> 2.mt_$i.job
   echo "/public/home/2020024/software/ins/bin/mia -F -r /public/home/2020024/reference/M.fasta -f /public/home/2020024/GSE/mit_bam/${i%.d*}_MT.fasta -m /public/home/2020024/GSE/mit_bam/${i%.d*}" >>  2.mt_$i.job
  echo "date" >> 2.mt_$i.job
 done
 
 
##-------------------------------------------------------------------------------------------------------## 
## input:/public/home/2020024/Adaptation_Project/Africa/bam
## output:/public/home/2020024/Adaptation_Project/Africa/gvcf
## script:/public/home/2020024/Adaptation_Project/Africa/script/gvcf
## Using indexed bam files.
## GATK版本gatk-4.1.2.0 不同版本间不兼容
 
cat /public/home/2020024/GSE/wgs.list | while read i
 do
   echo '#!/bin/bash' >>  index_$i.job
   echo '#SBATCH -J '$i'' >>  index_$i.job
   echo "#SBATCH -p Cnode2" >>  index_$i.job
   echo "#SBATCH -t 7-00:00" >> index_$i.job
   echo "#SBATCH -N 1" >> index_$i.job
   echo "#SBATCH -n 10" >> index_$i.job
   echo '#SBATCH -o /public/home/2020024/GSE/scripts/M.'$i'.o' >> index_$i.job
   echo '#SBATCH -e /public/home/2020024/GSE/scripts/M.'$i'.o' >> index_$i.job
   echo "date" >>  index_$i.job
   echo "/public/home/2020024/software/samtools-1.17/samtools index -@ 10 /public/home/2020024/GSE/wgs_bam/${i}.duplicate.bam " >> index_$i.job
   echo "date" >> index_$i.job
 done
 
 
for j in {1..27}
do 
mkdir chr$j
done

for j in {1..27}
do 
 cat /public/home/2020024/GSE/wgs.list | while read i
  do cd /public/home/2020024/GSE/scripts/gvcf/chr$j/
   echo '#!/bin/bash' >> Chr${j}_${i}_step1.job
   echo '#SBATCH -J '${j}_${i}_1'' >> Chr${j}_${i}_step1.job
   echo "#SBATCH -p Cnode_all"  >> Chr${j}_${i}_step1.job
   echo "#SBATCH -t 2-00:00" >> Chr${j}_${i}_step1.job
   echo "#SBATCH --mem=30G" >> Chr${j}_${i}_step1.job  
   echo "#SBATCH -N 1" >> Chr${j}_${i}_step1.job
   echo "#SBATCH -n 4" >> Chr${j}_${i}_step1.job
   echo '#SBATCH -o /public/home/2020024/GSE/scripts/gvcf/Chr'${j}_${i}_step1.o'' >> Chr${j}_${i}_step1.job
   echo '#SBATCH -e /public/home/2020024/GSE/scripts/gvcf/Chr'${j}_${i}_step1.e'' >> Chr${j}_${i}_step1.job
   echo "date" >> Chr${j}_${i}_step1.job
   echo "gatk=/public/home/2020024/software/gatk-4.1.2.0/" >> Chr${j}_${i}_step1.job
   echo "ref=/public/home/2020024/reference" >> Chr${j}_${i}_step1.job
   echo "bamfile=/public/home/2020024/GSE/wgs_bam/" >> Chr${j}_${i}_step1.job
   echo "gvcf=/public/home/2020024/GSE/wgs_bam/gvcf" >> Chr${j}_${i}_step1.job
   echo '$gatk/gatk --java-options "-Xmx30G -XX:+UseParallelGC -XX:ParallelGCThreads=4" HaplotypeCaller -R $ref/Oar_rambouillet.fa -I $bamfile/'${i}'.duplicate.bam --genotyping-mode DISCOVERY --input-prior 0.001 --input-prior 0.4995 -ERC GVCF -OVI true -L '$j' -O $gvcf/chr'${j}'/'${i}.${j}'.g.vcf.gz' >> Chr${j}_${i}_step1.job
   echo "date" >> Chr${j}_${i}_step1.job
 done
done

for j in {1..27}
do 
 cat /public/home/2020024/GSE/wgs.list | while read i
   do cd /public/home/2020024/GSE/scripts/gvcf/chr$j/
   sbatch Chr${j}_${i}_step1.job
   done
done


##-------------------------------------------------------------------------------------------------------##   
   
## Concatenates gvcf files (for example split by chromosome) from chromosome to individuals
## output:/public/home/casdao/kdylvfenghua/kdylvfenghua/Adaptation_Project/gvcf

## making MergeVcfs inputing file lists
 
for i in `cat  /public/home/2020024/GSE/wgs.list`; 
 do for j in `seq 1 27`;
  do 
   ls /public/home/2020024/GSE/wgs_bam/gvcf/chr$j/${i}.$j.g.vcf.gz; 
  done >> ${i}.chr.gvcf.list
 done 
 
 
for i in `cat /public/home/2020024/GSE/wgs.list`
  do 
   echo '#!/bin/bash' >> con_${i}_step1.job
   echo '#SBATCH -J 'con_${i}_step2'' >> con_${i}_step1.job
   echo "#SBATCH -p Cnode_all" >> con_${i}_step1.job
   echo "#SBATCH -t 10:00:00" >> con_${i}_step1.job
   echo "#SBATCH -N 1" >> con_${i}_step1.job
   echo "#SBATCH -n 4" >> con_${i}_step1.job
   echo '#SBATCH -o /public/home/2020024/GSE/scripts/vcf/con_'${i}_step2.o'' >> con_${i}_step1.job
   echo '#SBATCH -e /public/home/2020024/GSE/scripts/vcf/con_'${i}_step2.e'' >> con_${i}_step1.job
   echo "date" >> con_${i}_step1.job
   echo "/public/home/2020024/software/gatk-4.1.2.0/gatk MergeVcfs -I /public/home/2020024/GSE/wgs_bam/gvcf/${i}.chr.gvcf.list -O /public/home/2020024/GSE/wgs_bam/gvcf/${i}.g.vcf.gz" >> con_${i}_step1.job
   echo "date" >> con_${i}_step1.job
done    

##-------------------------------------------------------------------------------------------------------##
## JOINT GENOTYPING 
## New module CombineGVCFs
## /public/home/2020024/GSE/wgs_bam/vcf

for i in `cat  /public/home/2020024/GSE/wgs.list`; 
  do 
   ls /public/home/2020024/GSE/wgs_bam/gvcf/${i}.g.vcf.gz; 
  done >> 8.gvcf.list


for i in {1..27}
do 
mkdir chr$i;
cd chr$i;
mkdir tmp
cd ..;
done 

for i in {1..27}
do
   echo '#!/bin/bash' >> Chr${i}_step1.job
   echo '#SBATCH -J 'Chr${i}_step1'' >> Chr${i}_step1.job
   echo "#SBATCH -p Cnode_all"  >> Chr${i}_step1.job
   echo "#SBATCH -t 24:00:00" >> Chr${i}_step1.job
   echo "#SBATCH --mem=60G" >> Chr${i}_step1.job
   echo "#SBATCH -N 1" >> Chr${i}_step1.job
   echo "#SBATCH -n 10" >> Chr${i}_step1.job
   echo '#SBATCH -o /public/home/2020024/GSE/scripts/vcf/Chr'${i}_step1.o'' >> Chr${i}_step1.job
   echo '#SBATCH -e /public/home/2020024/GSE/scripts/vcf/Chr'${i}_step1.e'' >> Chr${i}_step1.job
   echo "date" >> Chr${i}_step1.job
   echo '/public/home/2020024/software/gatk-4.1.2.0/gatk --java-options "-Xmx50G -XX:+UseParallelGC -XX:ParallelGCThreads=10" \
         GenomicsDBImport \
         --genomicsdb-workspace-path /public/home/2020024/GSE/wgs_bam/vcf/chr'${i}'/DB \
         --batch-size 8 \
         --intervals '${i}' \
         --sample-name-map /public/home/2020024/GSE/wgs_bam/gvcf/8.gvcf.list \
         --tmp-dir=/public/home/2020024/GSE/wgs_bam/vcf/chr'${i}'/tmp \
         --reference /public/home/2020024/reference/Oar_rambouillet.fa \
         --reader-threads 10' >> Chr${i}_step1.job
   echo "date" >> Chr${i}_step1.job
 done 
 
 
for i in {1..27}
do 
sbatch Chr${i}_step1.job
done

##-------------------------------------------------------------------------------------------------------##

for i in {1..27}
do
   echo '#!/bin/bash' >> Chr${i}_step2.job
   echo '#SBATCH -J 'Chr${i}_step2'' >> Chr${i}_step2.job
   echo "#SBATCH -p Cnode_all"  >> Chr${i}_step2.job
   echo "#SBATCH -t 24:00:00" >> Chr${i}_step2.job
   echo "#SBATCH --mem=30G" >> Chr${i}_step2.job
   echo "#SBATCH -N 1" >> Chr${i}_step2.job
   echo "#SBATCH -n 10" >> Chr${i}_step2.job
   echo '#SBATCH -o /public/home/2020024/GSE/scripts/vcf/Chr'${i}_step2.o'' >> Chr${i}_step2.job
   echo '#SBATCH -e /public/home/2020024/GSE/scripts/vcf/Chr'${i}_step2.e'' >> Chr${i}_step2.job
   echo "date" >> Chr${i}_step2.job  
   echo '/public/home/2020024/software/gatk-4.1.2.0/gatk --java-options "-Xmx30G -XX:+UseParallelGC -XX:ParallelGCThreads=10" \
         GenotypeGVCFs \
         --reference /public/home/2020024/reference/Oar_rambouillet.fa \
         -V gendb:///public/home/2020024/GSE/wgs_bam/vcf/chr'${i}'/DB \
         -O /public/home/2020024/GSE/wgs_bam/vcf/raw_chr'${i}'.vcf.gz' >> Chr${i}_step2.job
   echo "date" >> Chr${i}_step2.job
done

##-------------------------------------------------------------------------------------------------------##
## Step1:区分snp/indel

for i in {1..27}
do
   echo '#!/bin/bash' >> filter_Chr${i}_step1.job
   echo '#SBATCH -J 'filter_Chr${i}_step1'' >> filter_Chr${i}_step1.job
   echo "#SBATCH -p Cnode_all"  >> filter_Chr${i}_step1.job
   echo "#SBATCH -t 24:00:00" >> filter_Chr${i}_step1.job
   echo "#SBATCH -N 1" >> filter_Chr${i}_step1.job
   echo "#SBATCH -n 1" >> filter_Chr${i}_step1.job
   echo '#SBATCH -o /public/home/2020024/GSE/scripts/vcf/filter_Chr'${i}_step1.o'' >> filter_Chr${i}_step1.job
   echo '#SBATCH -e /public/home/2020024/GSE/scripts/vcf/filter_Chr'${i}_step1.e'' >> filter_Chr${i}_step1.job
   echo "date" >> filter_Chr${i}_step1.job 
   echo '/public/home/2020024/software/gatk-4.1.2.0/gatk  \
         SelectVariants -select-type SNP \
         -V /public/home/2020024/GSE/wgs_bam/vcf/raw_chr'${i}'.vcf.gz \
         -O /public/home/2020024/GSE/wgs_bam/vcf/raw_chr'${i}'.snp.vcf.gz' >> filter_Chr${i}_step1.job
   echo "date" >> filter_Chr${i}_step1.job
done

for i in {3..26}
do sbatch filter_Chr${i}_step1.job
done 

##-------------------------------------------------------------------------------------------------------##
## Step2:根据硬过滤标准分别对snp

for i in {1..27}
do
   echo '#!/bin/bash' >> filter_Chr${i}_step2.job
   echo '#SBATCH -J 'filter_Chr${i}_step2'' >> filter_Chr${i}_step2.job
   echo "#SBATCH -p Cnode_all"  >> filter_Chr${i}_step2.job
   echo "#SBATCH -t 24:00:00" >> filter_Chr${i}_step2.job
   echo "#SBATCH -N 1" >> filter_Chr${i}_step2.job
   echo "#SBATCH -n 1" >> filter_Chr${i}_step2.job
   echo '#SBATCH -o /public/home/2020024/GSE/scripts/vcf/filter_Chr'${i}_step2.o'' >> filter_Chr${i}_step2.job
   echo '#SBATCH -e /public/home/2020024/GSE/scripts/vcf/filter_Chr'${i}_step2.e'' >> filter_Chr${i}_step2.job
   echo "date" >> filter_Chr${i}_step2.job 
   echo '/public/home/2020024/software/gatk-4.1.2.0/gatk VariantFiltration \
         -V /public/home/2020024/GSE/wgs_bam/vcf/raw_chr'${i}'.snp.vcf.gz \
         --filter-expression "QD < 2.0 || MQ < 40.0 || FS > 60.0 || SOR > 3.0 || MQRankSum < -12.5 || ReadPosRankSum < -8.0" \
         --filter-name "Filter" \
         -O /public/home/2020024/GSE/wgs_bam/vcf/filter_chr'${i}'.snp.vcf.gz' >> filter_Chr${i}_step2.job
   echo "date" >> filter_Chr${i}_step2.job
done

for i in {1..27}
do sbatch filter_Chr${i}_step2.job
done
##-------------------------------------------------------------------------------------------------------##
## Step3:提取高质量位点

for i in {1..27}
do
   echo '#!/bin/bash' >> filter_Chr${i}_step3.job
   echo '#SBATCH -J 'filter_Chr${i}_step3'' >> filter_Chr${i}_step3.job
   echo "#SBATCH -p Cnode_all"  >> filter_Chr${i}_step3.job
   echo "#SBATCH -t 24:00:00" >> filter_Chr${i}_step3.job
   echo "#SBATCH -N 1" >> filter_Chr${i}_step3.job
   echo "#SBATCH -n 1" >> filter_Chr${i}_step3.job
   echo '#SBATCH -o /public/home/2020024/GSE/scripts/vcf/filter_Chr'${i}_step3.o'' >> filter_Chr${i}_step3.job
   echo '#SBATCH -e /public/home/2020024/GSE/scripts/vcf/filter_Chr'${i}_step3.e'' >> filter_Chr${i}_step3.job
   echo "date" >> filter_Chr${i}_step3.job 
   echo '/public/home/2020024/software/gatk-4.1.2.0/gatk SelectVariants --exclude-filtered \
         -V /public/home/2020024/GSE/wgs_bam/vcf/filter_chr'${i}'.snp.vcf.gz \
         -O /public/home/2020024/GSE/wgs_bam/vcf/chr'${i}'.snp.vcf.gz' >> filter_Chr${i}_step3.job
   echo "date" >> filter_Chr${i}_step3.job
done

for i in {1..26}
do sbatch filter_Chr${i}_step3.job
done


# kk