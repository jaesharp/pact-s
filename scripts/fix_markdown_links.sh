#!/bin/bash

# Fix markdown links script
# Converts non-standard format `[./path/to/file](./path/to/file)` to standard format [./path/to/file](./path/to/file)

echo "Fixing markdown links in all .md files..."

# Process each markdown file
find . -name "*.md" -type f | while read -r file; do
    echo "Processing $file"
    
    # Create a temporary file
    temp_file=$(mktemp)
    
    # Replace the custom format with standard markdown links
    # This sed command looks for patterns like `[text](url)` and converts them to [text](url)
    sed -E 's/`\[(.*)\]\((.*)\)`/[\1](\2)/g' "$file" > "$temp_file"
    
    # Check if any changes were made
    if ! cmp -s "$file" "$temp_file"; then
        echo "  Fixed links in $file"
        mv "$temp_file" "$file"
    else
        echo "  No links to fix in $file"
        rm "$temp_file"
    fi
done

echo "Link fixing complete!" 