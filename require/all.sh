#!/bin/bash 

# DESCRIPTION: Runs all scripts in the same directory as this script.

# Absolute path to this script, e.g. /home/user/bin/foo.sh
THIS_SCRIPT=$(basename "$0")
# Absolute path this script is in, thus /home/user/bin
DIR=$(dirname "$0")

# Loop through all files in the directory
for SCRIPT in "$DIR"/*; do
  # Check if the file is not this script and is executable
  if [ "$(basename "$SCRIPT")" != "$(basename "$THIS_SCRIPT")" ]; then
    # Run the script
    "$SCRIPT"
  fi
done
