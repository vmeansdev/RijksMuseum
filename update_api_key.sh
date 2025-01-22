#!/bin/bash

# Check if an argument is provided
if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <new_api_key>"
    exit 1
fi

NEW_API_KEY=$1

# Initialize a flag to track success
success=true

# Find and replace in .xcconfig files
find . -type f -name "*.xcconfig" -exec sed -i '' "s/API_KEY = API_KEY_GOES_HERE/API_KEY = $NEW_API_KEY/g" {} + || success=false

# Check if any replacements were made
if [ "$success" = true ]; then
    echo "API_KEY has been successfully updated in all .xcconfig files."
else
    echo "Error: Failed to update API_KEY in one or more .xcconfig files."
fi