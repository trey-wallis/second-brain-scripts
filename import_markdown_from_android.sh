#!/bin/bash

if [ $# -ne 2 ]; then
    echo "Usage: ./import_markdown_from_android.sh <remote-folder> <destination-folder>"
    exit 2
fi

# Remove any trailing slashes
remote="${1%/}"
dest="${2%/}"

# Get the vault folder name
vault_name="$(basename $remote)"

current_timestamp=$(date +"%Y-%m-%d_%H-%M-%S")
tmp="/tmp/import_from_android-$current_timestamp"
mkdir -p "$tmp"

# Pull files from remote
result="$(adb pull $remote/ $tmp)"

# If there was an error while pulling, then exit
if [[ $result == *"error:"* ]]; then
    echo $result >&2
    exit 1
fi

# If the pull was successful
if [[ $result == *"0 skipped"* ]]; then
    num_files="$(find $tmp -name '*.md' | wc -l)"
    
    if [ $num_files -eq 0 ]; then
        echo "0 markdown files were pulled from remote."
        exit 1
    fi
    
    # Iterate over all the markdown files
    for file in $tmp/$vault_name/*.md; do
        filename="$(basename $file)"
        file_data=`cat $file`
        
        output_file="$dest/$filename"
        
        # If a file exists, append data to it, otherwise write to a new file
        if [ -f "$output_file" ]; then
            echo "Updating: $filename"
            echo "$file_data" >> "$output_file"
        else
            echo "Writing: $filename"
            echo "$file_data" > "$output_file"
        fi
    done
    
    # Delete remote files
    adb shell rm -r $remote/*.md
fi