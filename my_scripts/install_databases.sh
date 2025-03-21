#!/bin/bash

# Define default value 
db_dir="databases"

# Check if user provided input
if [[ $1 ]]; then
  db_dir=$1
fi

# Define current location
here=$(pwd)

# Create database folder and navigate
mkdir -p $db_dir
cd $db_dir

# Check and set up ResFinder database
if [ -d "resfinder_db" ] && [ "$(ls -A resfinder_db)" ]; then
  echo "ResFinder database detected."
else
  echo "Setting up ResFinder database..."
  git clone https://bitbucket.org/genomicepidemiology/resfinder_db/
  cd resfinder_db
  
  # Execute resfinder-db install using python modules from its own environment
  mamba run -n cge_env python3 INSTALL.py
  
  # Return to previous location
  cd $here
fi

echo "Done!"