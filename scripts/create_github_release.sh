#!/bin/bash
set -e

PROJECT_DIR=$(dirname "$(dirname "$0")")
SCRIPTS_DIR=$(dirname "$0")

if [ "$#" -ne 3 ]; then
    echo "Usage: $0 <version> <dmg_path> <release_notes_with_signature>"
    echo "Creates a GitHub release with the specified DMG and release notes"
    echo ""
    echo "Example: $0 \"1.0.0\" \"path/to/dmg\" \"$(cat release_notes.txt)\""
    exit 1
fi

VERSION="$1"
DMG_PATH="$2"
RELEASE_NOTES="$3"

# Check if the DMG file exists
if [ ! -f "$DMG_PATH" ]; then
    echo "Error: DMG file not found at $DMG_PATH"
    exit 1
fi

# Check if gh CLI is installed
if ! command -v gh &> /dev/null; then
    echo "Error: GitHub CLI (gh) is not installed"
    echo "Please install it from https://cli.github.com/"
    exit 1
fi

# Create GitHub release
echo "Creating GitHub release for version $VERSION..."
cd "$PROJECT_DIR" && gh release create "$VERSION" "$DMG_PATH" \
    --title "$VERSION" \
    --notes "$RELEASE_NOTES"

if [ $? -ne 0 ]; then
    echo "Error: Failed to create GitHub release"
    exit 1
fi

echo "GitHub release created successfully!" 