#!/bin/bash
set -e

# Configuration
PROJECT_DIR=$(dirname "$(dirname "$0")")
CHANGELOG_FILE="$PROJECT_DIR/CHANGELOG.md"

if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <version>"
    echo "Extracts release notes for the specified version from CHANGELOG.md"
    exit 1
fi

VERSION="$1"

# Extract release notes from CHANGELOG.md
echo "Extracting release notes for version $VERSION from CHANGELOG.md..."
RELEASE_NOTES=$(awk -v ver="# $VERSION" 'BEGIN{flag=0; buf=""}
    $0 ~ ver {flag=1; next}
    flag && /^# / {exit}
    flag && /^---/ {exit}
    flag {buf = buf $0 "\n"}
    END{print buf}' "$CHANGELOG_FILE" | sed '/^$/d')

if [ -z "$RELEASE_NOTES" ]; then
    echo "Warning: No release notes found for version $VERSION in CHANGELOG.md"
    echo "Please add release notes in the format:"
    echo "# $VERSION"
    echo "- Your changes here"
    echo "---"
    exit 1
fi

echo "$RELEASE_NOTES" 