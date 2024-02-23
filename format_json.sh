#!/bin/bash

# Loop through all .json files in the 'execute' directory
for initialPath in $(find execute -name "*.json"); do
    filename=$(basename -- "$initialPath")
    dirname=$(dirname -- "$initialPath")
    tempPath="$dirname/temp_${filename}"

    # Format the JSON file and overwrite it
    if jq '.' "$initialPath" > "$tempPath"; then
        echo "Formatted $filename"
        mv "$tempPath" "$initialPath"
    else
        echo "Failed to format $filename"
    fi
done

echo "All .json files have been formatted."