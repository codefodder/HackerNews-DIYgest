#!/bin/bash

# Check for $GITHUB_STEP_SUMMARY and associated file existence.
if [ -n "$GITHUB_STEP_SUMMARY" ] && [ -f "$GITHUB_STEP_SUMMARY" ]; then
    # Assume it's markdown and produce the HTML summary using pulldown-cmark.
    echo "Converting Markdown to HTML..."
    # Ensure pulldown-cmark is available. If not, install it.
    if ! command -v pulldown-cmark &> /dev/null; then
        cargo install pulldown-cmark
    fi

    # Convert the markdown file to HTML with a timestamped filename.
    timestamp=$(date --iso-8601=seconds)
    html_output="${GITHUB_STEP_SUMMARY%.md}-${timestamp}.html"
    pulldown-cmark "$GITHUB_STEP_SUMMARY" > "$html_output"
    echo "Markdown converted to HTML successfully."
fi

