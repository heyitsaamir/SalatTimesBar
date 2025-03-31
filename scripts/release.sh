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

SIGN_UPDATE=$(find ~/Library/Developer/Xcode/DerivedData -name "SalatTimeBar*" -type d -exec find {} -name "sign_update" \; | grep "/bin/sign_update$" | grep -v "old_dsa_scripts" | head -n 1)
# execute sign update for the resultant DMG file
if [ -f "$SIGN_UPDATE" ]; then
    echo "sign_update script found at $SIGN_UPDATE"
else
    echo "sign_update script not found."
    exit 1
fi

# Create DMG file
create-dmg \
  --volname "$PROJECT_NAME" \
  --window-pos 200 120 \
  --window-size 800 400 \
  --icon-size 100 \
  --icon "$PROJECT_NAME.app" 200 190 \
  --hide-extension "$PROJECT_NAME.app" \
  --app-drop-link 600 185 \
  "Product/$FOLDER_NAME/$PROJECT_NAME.dmg" \
  "Product/$FOLDER_NAME/$PROJECT_NAME.app"

# Check if DMG creation was successful
if [ $? -eq 0 ]; then
    echo "DMG created successfully at Product/$FOLDER_NAME/$PROJECT_NAME.dmg"
else
    echo "Failed to create DMG"
    exit 1
fi

"$SIGN_UPDATE" "Product/$FOLDER_NAME/SalatTimeBar.dmg"