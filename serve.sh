#!/bin/bash

# Exit on error
set -e

# Check if presentation.md exists
PRESENTATION_PATH="dx-day-2025/presentation.md"
if [ ! -f "$PRESENTATION_PATH" ]; then
    echo "Error: $PRESENTATION_PATH not found!"
    exit 1
fi

# Create output directory if it doesn't exist
OUTPUT_DIR="dx-day-2025/public"
mkdir -p "$OUTPUT_DIR"

# Copy reveal.js to the output directory
echo "Copying reveal.js to output directory..."
mkdir -p "$OUTPUT_DIR/reveal.js"
cp -r /opt/reveal.js/* "$OUTPUT_DIR/reveal.js/"

# Function to convert markdown to HTML
convert_markdown() {
    echo "Converting markdown to HTML..."
    # Use pandoc to convert markdown to HTML with a nice template
    pandoc "$PRESENTATION_PATH" \
        -o "$OUTPUT_DIR/index.html" \
        --standalone \
        --template=default.revealjs \
        --variable revealjs-url=./reveal.js \
        --variable theme=white \
        --variable transition=slide \
        -t revealjs
    
    echo "HTML generated at $OUTPUT_DIR/index.html"
}

# Initial conversion
convert_markdown

# Start the live-server
echo "Starting web server with live reload..."
npx live-server "$OUTPUT_DIR" --port=8080 --no-browser &
SERVER_PID=$!

# Watch for changes in the markdown file
echo "Watching for changes in $PRESENTATION_PATH..."
while inotifywait -e modify "$PRESENTATION_PATH"; do
    convert_markdown
done

# Clean up
kill $SERVER_PID 