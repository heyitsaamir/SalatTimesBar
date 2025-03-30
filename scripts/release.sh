#!/bin/bash
PROJECT_NAME=SalatTimeBar
PROJECT_DIR=$(pwd)/$PROJECT_NAME
INFOPLIST_FILE="Info.plist"

# Get the current version
CFBundleVersion=$(/usr/libexec/PlistBuddy -c "Print CFBundleVersion" "${PROJECT_DIR}/${INFOPLIST_FILE}")

FOLDER_NAME=${PROJECT_NAME}.$CFBundleVersion

# Check if the app exists
if [ ! -d "Product/$FOLDER_NAME/$PROJECT_NAME.app" ]; then
    echo "Product/$FOLDER_NAME/$PROJECT_NAME.app does not exist. Please build the project first."
    exit 1
fi

# Create DMG file
create-dmg \
  --volname "SalatTimeBar" \
  --window-pos 200 120 \
  --window-size 800 400 \
  --icon-size 100 \
  --icon "SalatTimeBar.app" 200 190 \
  --hide-extension "SalatTimeBar.app" \
  --app-drop-link 600 185 \
  "Product/$FOLDER_NAME/SalatTimeBar.dmg" \
  "Product/$FOLDER_NAME/$PROJECT_NAME.app"

# Check if DMG creation was successful
if [ $? -eq 0 ]; then
    echo "DMG created successfully at Product/$FOLDER_NAME/SalatTimeBar.dmg"
else
    echo "Failed to create DMG"
    exit 1
fi