#!/bin/bash

read1=$1
read2=$2
output_dir=$3
database_dir=$4

# Debugging: Print values
echo "Read 1: $read1"
echo "Read 2: $read2"
echo "Output Directory: $output_dir"
echo "Database Directory: $database_dir"

# Variables
sample=$(basename $read1 _R1.fastq.gz)
outdir=$output_dir/ResFinder/$sample
db_dir=$database_dir/resfinder_db

mamba run -n cge_env run_resfinder.py -ifq $read1 $read2 -o $outdir -db_res $db_dir -db_res_kma $db_dir --acquired