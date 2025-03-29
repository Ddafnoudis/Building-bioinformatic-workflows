#!/bin/bash

# Automatically detect input files
read1=$1
read2=$2
output_dir=$3

# Run Shovill
mamba run -n assembly shovill --trim ON --R1 $read1 --R2 $read2 --outdir $output_dir --force