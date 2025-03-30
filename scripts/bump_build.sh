#!/bin/sh

if [ $# -ne 1 ]; then
    echo "Usage: $0 [major|minor|patch]"
    exit 1
fi

PROJECT_DIR=$(pwd)/SalatTimeBar
XCODE_PROJ_DIR="$(pwd)/SalatTimeBar.xcodeproj"
INFOPLIST_FILE="Info.plist"

current_version=`sed -n '/MARKETING_VERSION/{s/MARKETING_VERSION = //;s/;//;s/^[[:space:]]*//;p;q;}' ${XCODE_PROJ_DIR}/project.pbxproj`
echo "Current version: $current_version"

# Get current version
currentVersion=$(/usr/libexec/PlistBuddy -c "Print CFBundleVersion" "${PROJECT_DIR}/${INFOPLIST_FILE}")
echo Current version: $currentVersion

# Split version into components
major=$(echo $currentVersion | cut -d. -f1)
minor=$(echo $currentVersion | cut -d. -f2)
patch=$(echo $currentVersion | cut -d. -f3)

# Update version based on argument
case $1 in
    "major")
        major=$((major + 1))
        minor=0
        patch=0
        ;;
    "minor")
        minor=$((minor + 1))
        patch=0
        ;;
    "patch")
        patch=$((patch + 1))
        ;;
    *)
        echo "Invalid argument. Use major, minor, or patch"
        exit 1
        ;;
esac

# Create new version string
newVersion="${major}.${minor}.${patch}"
echo "New version: $newVersion"

# Update the version in Info.plist
/usr/libexec/PlistBuddy -c "Set :CFBundleShortVersionString $newVersion" "${PROJECT_DIR}/${INFOPLIST_FILE}"
/usr/libexec/PlistBuddy -c "Set :CFBundleVersion $newVersion" "${PROJECT_DIR}/${INFOPLIST_FILE}"
sed -i '' -e "s|MARKETING_VERSION \= [^\d;$]*\;|MARKETING_VERSION = ${newVersion};|" ${XCODE_PROJ_DIR}/project.pbxproj
sed -i '' -e "s|CURRENT_PROJECT_VERSION \= [^\d;$]*\;|CURRENT_PROJECT_VERSION = ${newVersion};|" ${XCODE_PROJ_DIR}/project.pbxproj