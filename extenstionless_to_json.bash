#!/bin/bash

# Function to recursively rename files to JSON format
rename_to_json() {
    local dir="$1"

    # Loop through each item in the directory
    for item in "$dir"/*; do
        # Check if the item is a file
        if [ -f "$item" ]; then
            # Extract the filename without extension
            filename=$(basename -- "$item")
            filename_no_ext="${filename%.*}"
            
            # Rename the file to JSON format
            mv "$item" "${dir}/${filename_no_ext}.json"
        elif [ -d "$item" ]; then
            # If the item is a directory, recursively call the function
            rename_to_json "$item"
        fi
    done
}

# Start renaming files in the specified directory
rename_to_json "stocknet-dataset/tweet/preprocessed"
