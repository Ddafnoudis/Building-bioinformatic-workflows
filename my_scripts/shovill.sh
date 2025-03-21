#!/bin/bash

# Define the variables
read1=Dataset/*_1.fastq.gz*
read2=Dataset/*_2.fastq.gz*
output_dir=Results/shovill

# Create the output directory 
mkdir -p $output_dir

mamba run -n assembly shovill --trim ON --R1 $read1 --R2 $read2 --outdir $output_dir --force
