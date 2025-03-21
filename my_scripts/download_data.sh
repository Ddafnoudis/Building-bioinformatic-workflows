#!/bin/bash

#  Creat the dataset folder
mkdir -p Dataset

# Download data
wget -nc ftp://ftp.sra.ebi.ac.uk/vol1/fastq/ERR142/040/ERR14229040/ERR14229040_1.fastq.gz
wget -nc ftp://ftp.sra.ebi.ac.uk/vol1/fastq/ERR142/040/ERR14229040/ERR14229040_2.fastq.gz
wget -nc ftp://ftp.sra.ebi.ac.uk/vol1/fastq/ERR142/089/ERR14229089/ERR14229089_1.fastq.gz
wget -nc ftp://ftp.sra.ebi.ac.uk/vol1/fastq/ERR142/089/ERR14229089/ERR14229089_2.fastq.gz

# Move fastqc files to dataset/folder
mv *.fastq.gz* Dataset/

