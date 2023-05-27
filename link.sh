#!/bin/bash

## script to take an input of a folder in this directory and then create symlinks of the files in that directory to the target directory ~/d/git/Auto-GPT/aut_gpt_workspace
## ignore ai_settings.yaml alone

## Usage: ./link.sh <folder_name>

## e.g. ./link.sh ~/d/git/Auto-GPT/aut_gpt_workspace

folder=$1
if [ -z "$folder" ]; then
    echo "No folder specified"
    exit 1
fi

if [ ! -d "$folder" ]; then
    echo "Folder $folder does not exist"
    exit 1
fi

for each in "$folder"/*; do
    if [ "${each##*/}" = "ai_settings.yaml" ]; then
        continue
    else
        ln -s "$each" ~/d/git/Auto-GPT/auto_gpt_workspace/"${each##*/}"
    fi
done