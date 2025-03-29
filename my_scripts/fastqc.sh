#!/bin/bash

# Automatically detect input files
read1=$1
read2=$2
output_dir=$3

# Output directory
fastqc_dir=$output_dir/FastQC

# Threads
threads=4

# Create output directory
mkdir -p $fastqc_dir

# Run FastQC
mamba run -r course_env fastqc $read1 $read2 -o $fastqc_dir -t $threads
