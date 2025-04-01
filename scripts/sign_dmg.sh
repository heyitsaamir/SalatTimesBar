#!/bin/bash
set -e

if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <dmg_path>"
    echo "Signs the DMG file for Sparkle updates and outputs signature and file size"
    exit 1
fi

DMG_PATH="$1"

# Check if the DMG file exists
if [ ! -f "$DMG_PATH" ]; then
    echo "Error: DMG file not found at $DMG_PATH"
    exit 1
fi

# Locate the sign_update tool from Sparkle
SIGN_UPDATE=$(find ~/Library/Developer/Xcode/DerivedData -name "SalatTimeBar*" -type d -exec find {} -name "sign_update" \; | grep "/bin/sign_update$" | grep -v "old_dsa_scripts" | head -n 1)
if [ ! -f "$SIGN_UPDATE" ]; then
    echo "Error: sign_update script not found."
    exit 1
fi

# Get DMG signature and file size
DMG_SIZE=$(stat -f%z "$DMG_PATH")
SIGNATURE=$("$SIGN_UPDATE" "$DMG_PATH" 2>&1 | grep "sparkle:edSignature" | awk -F'"' '{print $2}')

if [ -z "$SIGNATURE" ]; then
    echo "Error: Failed to generate Sparkle signature"
    exit 1
fi

echo "sparkle:edSignature=\"$SIGNATURE\" length=\"$DMG_SIZE\"" 