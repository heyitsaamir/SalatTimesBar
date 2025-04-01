#!/bin/bash
set -e

PROJECT_DIR=$(dirname "$(dirname "$0")")
PROJECT_NAME=SalatTimeBar
APPCAST_FILE="$PROJECT_DIR/docs/Support/appcast.xml"
TEMP_FILE="/tmp/appcast_new_entries.xml"
SIGNATURE_FILE="$PROJECT_DIR/.sparkle_signatures"

# Check if gh CLI is installed
if ! command -v gh &> /dev/null; then
    echo "Error: GitHub CLI (gh) is not installed"
    echo "Please install it from https://cli.github.com/"
    exit 1
fi

# Check if jq is installed
if ! command -v jq &> /dev/null; then
    echo "Error: jq is not installed"
    echo "Please install it with 'brew install jq' or from https://stedolan.github.io/jq/"
    exit 1
fi

# Create appcast.xml file if it doesn't exist
if [ ! -f "$APPCAST_FILE" ]; then
    echo "Creating new appcast.xml file..."
    cat > "$APPCAST_FILE" << EOF
<?xml version="1.0" encoding="utf-8"?>
<rss version="2.0" xmlns:sparkle="http://www.andymatuschak.org/xml-namespaces/sparkle" xmlns:dc="http://purl.org/dc/elements/1.1/">
    <channel>
        <title>$PROJECT_NAME</title>
        <description>Most recent changes with links to updates.</description>
        <language>en</language>
    </channel>
</rss>
EOF
fi

# Get existing versions from appcast.xml
echo "Reading existing versions..."
EXISTING_VERSIONS=$(grep -o '<sparkle:version>[^<]*</sparkle:version>' "$APPCAST_FILE" | sed 's/<sparkle:version>\(.*\)<\/sparkle:version>/\1/')

# Create a temporary file for new entries
> "$TEMP_FILE"

# Get all releases from GitHub and check for new ones
echo "Fetching GitHub releases..."
cd "$PROJECT_DIR" && gh release list --limit 100 | while read -r line; do
    # Extract version (tag) from the release list output
    TAG=$(echo "$line" | awk '{print $1}')
    
    # Skip if not a valid version number (x.y.z format)
    if ! [[ $TAG =~ ^[0-9]+\.[0-9]+\.[0-9]+$ ]]; then
        echo "Skipping non-version release: $TAG"
        continue
    fi
    
    # Skip if version already exists in appcast
    if echo "$EXISTING_VERSIONS" | grep -q "^$TAG$"; then
        echo "Skipping existing version: $TAG"
        continue
    fi
    
    echo "Processing new release: $TAG"
    
    # Get release information
    RELEASE_INFO=$(gh release view "$TAG" --json name,body,publishedAt,assets)
    
    # Extract needed fields
    NAME=$(echo "$RELEASE_INFO" | jq -r '.name')
    BODY=$(echo "$RELEASE_INFO" | jq -r '.body')
    DATE=$(echo "$RELEASE_INFO" | jq -r '.publishedAt')
    ASSET_URL=$(echo "$RELEASE_INFO" | jq -r '.assets[0].url')
    LENGTH=$(echo "$RELEASE_INFO" | jq -r '.assets[0].size')
    
    # Get signature from signature file
    if [ -f "$SIGNATURE_FILE" ]; then
        SIGNATURE=$(grep "^$TAG:" "$SIGNATURE_FILE" | cut -d':' -f2-)
        if [ -z "$SIGNATURE" ]; then
            echo "Warning: No signature found for version $TAG in $SIGNATURE_FILE, skipping"
            continue
        fi
    else
        echo "Warning: Signature file not found at $SIGNATURE_FILE, skipping"
        continue
    fi
    
    # Format date to RFC822
    RFC_DATE=$(date -jf "%Y-%m-%dT%H:%M:%SZ" "$DATE" "+%a, %d %b %Y %H:%M:%S %z")
    
    # Add item to temporary file
    cat >> "$TEMP_FILE" << ITEM
        <item>
            <title>Version $NAME</title>
            <description><![CDATA[$BODY]]></description>
            <pubDate>$RFC_DATE</pubDate>
            <sparkle:version>$NAME</sparkle:version>
            <link>https://github.com/$(gh repo view --json nameWithOwner -q .nameWithOwner)/releases/tag/$TAG</link>
            <enclosure
                url="$ASSET_URL"
                sparkle:version="$NAME"
                sparkle:edSignature="$SIGNATURE"
                length="$LENGTH"
                type="application/octet-stream" />
        </item>
ITEM
done

# If we have new entries, add them to the appcast file
if [ -s "$TEMP_FILE" ]; then
    echo "Adding new entries to appcast.xml..."
    # Insert new entries after the <language> tag
    sed -i '' '/<language>en<\/language>/r '"$TEMP_FILE"'' "$APPCAST_FILE"
    echo "New entries added successfully"
else
    echo "No new entries to add"
fi

# Clean up
rm -f "$TEMP_FILE"

echo "Appcast.xml update completed at $APPCAST_FILE" 