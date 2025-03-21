#!/bin/bash

# Define the variables
read1=$1
read2=$2
outdir=$3

echo "Input read files: $read1, $read2"
echo "Output directory: $outdir"

# Check if data files exist before downloading
if [ ! -f "Dataset/ERR14229040_1.fastq.gz" ] || [ ! -f "Dataset/ERR14229040_2.fastq.gz" ]; then
  bash my_scripts/download_data.sh
else
  echo "Data files already exist, skipping download."
fi

# Check if FastQC output exists before running
if [ ! -f "$outdir/ERR14229040_1_fastqc.html" ]; then
  bash my_scripts/fastqc.sh $read1 $read2 $outdir
else
  echo "FastQC results already exist, skipping FastQC."
fi

# Check if Shovill output exists before running
if [ ! -f "$outdir/shovill/contigs.fa" ]; then
  bash my_scripts/shovill.sh $read1 $read2 $outdir
else
  echo "Shovill output already exists, skipping Shovill."
fi

# Check if database is installed before installing
if [ ! -d "$db_dir/resfinder_db" ]; then
  bash my_scripts/install_databases.sh $db_dir
else
  echo "Databases already installed, skipping installation."
fi

# Check if ResFinder output exists before running
if [ ! -f "$outdir/ResFinder_output.txt" ]; then
  bash my_scripts/execute_resfinder.sh $read1 $read2 $outdir $database_dir
else
  echo "ResFinder results already exist, skipping ResFinder."
fi
