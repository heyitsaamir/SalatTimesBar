#!/bin/bash
set -e

# Configuration
PROJECT_NAME=SalatTimeBar
PROJECT_DIR=$(dirname "$(dirname "$0")")
INFOPLIST_FILE="Info.plist"
SCRIPTS_DIR=$(dirname "$0")
PRODUCT_DIR="$PROJECT_DIR/Product"
TEMP_DIR="/tmp/salattimebar_release"

# Make all scripts executable
chmod +x "$SCRIPTS_DIR"/*.sh

# Function to display usage
usage() {
    echo "Usage: $0 [options] [major|minor|patch]"
    echo ""
    echo "Options:"
    echo "  --help             Show this help message"
    echo "  --bump-only        Only bump version, don't create release"
    echo "  --dmg-only         Only create DMG (assumes app already exists)"
    echo "  --release-only     Only create GitHub release (assumes DMG exists)"
    echo "  --appcast-only     Only generate appcast.xml"
    echo "  --skip-bump        Skip version bump"
    echo "  --skip-dmg         Skip DMG creation"
    echo "  --skip-release     Skip GitHub release"
    echo "  --skip-appcast     Skip appcast.xml generation"
    echo ""
    echo "Description:"
    echo "  This script coordinates the release process with the following steps:"
    echo "  1. Bumps version number using bump_build.sh"
    echo "  2. Creates DMG from the built app using release.sh"
    echo "  3. Extracts release notes from CHANGELOG.md"
    echo "  4. Signs DMG for Sparkle updates"
    echo "  5. Creates GitHub release with release notes"
    echo "  6. Generates appcast.xml for auto-updates"
    echo ""
    echo "  Each step can be run independently using the options above."
    echo "  If a step fails, you can fix the issue and continue from that step."
    exit 1
}

# Parse command line arguments
BUMP_VERSION=true
CREATE_DMG=true
CREATE_RELEASE=true
GENERATE_APPCAST=true
VERSION_TYPE=""

# Create temp directory
mkdir -p "$TEMP_DIR"

# Parse command line arguments
while [[ $# -gt 0 ]]; do
    case $1 in
        --help)
            usage
            ;;
        --bump-only)
            CREATE_DMG=false
            CREATE_RELEASE=false
            GENERATE_APPCAST=false
            shift
            ;;
        --dmg-only)
            BUMP_VERSION=false
            CREATE_RELEASE=false
            GENERATE_APPCAST=false
            shift
            ;;
        --release-only)
            BUMP_VERSION=false
            CREATE_DMG=false
            shift
            ;;
        --appcast-only)
            BUMP_VERSION=false
            CREATE_DMG=false
            CREATE_RELEASE=false
            shift
            ;;
        --skip-bump)
            BUMP_VERSION=false
            shift
            ;;
        --skip-dmg)
            CREATE_DMG=false
            shift
            ;;
        --skip-release)
            CREATE_RELEASE=false
            shift
            ;;
        --skip-appcast)
            GENERATE_APPCAST=false
            shift
            ;;
        major|minor|patch)
            VERSION_TYPE=$1
            shift
            ;;
        *)
            echo "Unknown option: $1"
            usage
            ;;
    esac
done

# If version type is required but not provided, show usage
if [ "$BUMP_VERSION" = true ] && [ -z "$VERSION_TYPE" ]; then
    echo "Error: Version type [major|minor|patch] is required when bumping version"
    usage
fi

# Step 1: Bump version
if [ "$BUMP_VERSION" = true ]; then
    echo "Step 1: Bumping version ($VERSION_TYPE)..."
    $SCRIPTS_DIR/bump_build.sh $VERSION_TYPE
    echo "Version bump completed"
fi

# Get current version
CFBundleVersion=$(/usr/libexec/PlistBuddy -c "Print CFBundleVersion" "${PROJECT_DIR}/${PROJECT_NAME}/${INFOPLIST_FILE}")
FOLDER_NAME=${PROJECT_NAME}.$CFBundleVersion

echo "Current version: $CFBundleVersion"

# Step 2: Create DMG
if [ "$CREATE_DMG" = true ]; then
    echo "Step 2: Checking for exported app..."
    if [ ! -d "$PRODUCT_DIR/$FOLDER_NAME/$PROJECT_NAME.app" ]; then
        echo "Error: $PRODUCT_DIR/$FOLDER_NAME/$PROJECT_NAME.app does not exist."
        echo "Please build, archive, notarize, and export the app using Xcode first."
        echo "Make sure to export it to $PRODUCT_DIR/$FOLDER_NAME/"
        exit 1
    fi
    
    echo "Creating DMG..."
    $SCRIPTS_DIR/release.sh
    echo "DMG creation completed"
fi

# Define DMG path
DMG_PATH="$PRODUCT_DIR/$FOLDER_NAME/$PROJECT_NAME.dmg"

# Check if DMG exists
if [ ! -f "$DMG_PATH" ]; then
    echo "Error: DMG file not found at $DMG_PATH"
    echo "Please create the DMG first using --dmg-only or without --skip-dmg"
    exit 1
fi

# Step 3 & 4: Extract release notes and sign DMG
if [ "$CREATE_RELEASE" = true ]; then
    # Extract release notes
    echo "Step 3: Extracting release notes from CHANGELOG.md..."
    RELEASE_NOTES=$("$SCRIPTS_DIR/extract_release_notes.sh" "$CFBundleVersion") || {
        echo "Failed to extract release notes. Please check CHANGELOG.md"
        echo "Add a section for version $CFBundleVersion in the format:"
        echo "# $CFBundleVersion"
        echo "- Your changes here"
        echo "---"
        exit 1
    }
    echo "Release notes extracted successfully"
    
    # Sign DMG for Sparkle
    echo "Step 4: Signing DMG for Sparkle updates..."
    SIGNATURE_INFO=$("$SCRIPTS_DIR/sign_dmg.sh" "$DMG_PATH") || {
        echo "Failed to sign DMG. Check if Sparkle framework is properly installed."
        exit 1
    }
    echo "DMG signed successfully"
    
    # Combine release notes with signature
    RELEASE_NOTES_WITH_SIGNATURE="$RELEASE_NOTES

$SIGNATURE_INFO"
    
    # Save to temp file for debugging
    echo "$RELEASE_NOTES_WITH_SIGNATURE" > "$TEMP_DIR/release_notes_$CFBundleVersion.txt"
    
    # Create GitHub release
    echo "Step 5: Creating GitHub release..."
    "$SCRIPTS_DIR/create_github_release.sh" "$CFBundleVersion" "$DMG_PATH" "$RELEASE_NOTES_WITH_SIGNATURE" || {
        echo "Failed to create GitHub release. You can try again with:"
        echo "$0 --release-only"
        exit 1
    }
    echo "GitHub release created successfully"
fi

# Step 6: Generate appcast.xml
if [ "$GENERATE_APPCAST" = true ]; then
    echo "Step 6: Generating appcast.xml..."
    "$SCRIPTS_DIR/generate_appcast.sh" || {
        echo "Failed to generate appcast.xml. You can try again with:"
        echo "$0 --appcast-only"
        exit 1
    }
    echo "Appcast.xml generated successfully"
fi

echo "Release process completed successfully!"
echo "Version $CFBundleVersion has been released."
echo "Remember to push changes to GitHub to update the website."
echo "  git add $PROJECT_DIR/CHANGELOG.md $PROJECT_DIR/docs/Support/appcast.xml"
echo "  git commit -m \"Release $CFBundleVersion\""
echo "  git push" 