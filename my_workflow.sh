#!/bin/bash

# Find the first file that matches the pattern *_1.fastq.gz*
read1=$(ls Dataset/*_1.fastq.gz* 2>/dev/null | head -n 1)

# Find the first file that matches the pattern *_2.fastq.gz*
read2=$(ls Dataset/*_2.fastq.gz* 2>/dev/null | head -n 1)

# Define output directories
outdir="Results"
outdir_shovill="$outdir/shovill"
db_dir="databases"


# Check if data files exist before downloading
if [ ! -f "$read1" ] || [ ! -f "$read2" ]; then
  bash my_scripts/download_data.sh
else
  echo "Data files already exist, skipping download."
fi


# Check if FastQC output exists before running
bash my_scripts/fastqc.sh $read1 $read2 $outdir/FastQC

# Check if Shovill output exists before running
bash my_scripts/shovill.sh $read1 $read2 $outdir_shovill

# Check if database is installed before installing
bash my_scripts/install_databases.sh $db_dir

# Check if ResFinder output exists before running
bash my_scripts/execute_resfinder.sh $read1 $read2 $outdir $db_dir