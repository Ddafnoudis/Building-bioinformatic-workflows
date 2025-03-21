#!/bin/bash

# Define the variables
read1=Dataset/ERR14229040_1.fastq.gz
read2=Dataset/ERR14229040_2.fastq.gz
output_dir=Results/FastQC
threads=4

# Run FastQC
# Check if data files exist before downloading
if [ ! -f "$outdir/ERR14229040_1_fastqc.html" ]; then
    mamba run -r course_env fastqc $read1 $read2 -o $output_dir -t $threads
else
  echo ""
fi

