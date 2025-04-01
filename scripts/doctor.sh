#!/bin/bash
set -e

# Color codes for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Configuration
PROJECT_NAME=SalatTimeBar
PROJECT_DIR=$(dirname "$(dirname "$0")")
SCRIPTS_DIR=$(dirname "$0")
INFOPLIST_FILE="$PROJECT_DIR/$PROJECT_NAME/Info.plist"
PRODUCT_DIR="$PROJECT_DIR/Product"
APPCAST_FILE="$PROJECT_DIR/docs/Support/appcast.xml"
CHANGELOG_FILE="$PROJECT_DIR/CHANGELOG.md"

# Function to check if a command is available
check_command() {
    echo "Checking if $1 is installed"
    if command -v $1 &> /dev/null; then
        echo -e "${GREEN}✓${NC} $1 is available"
        return 0
    else
        echo -e "${RED}✗${NC} $1 is not installed"
        return 1
    fi
}

# Function to check if a file exists
check_file() {
    if [ -f "$1" ]; then
        echo -e "${GREEN}✓${NC} $1 exists"
        return 0
    else
        echo -e "${RED}✗${NC} $1 does not exist"
        return 1
    fi
}

# Function to check if a directory exists
check_directory() {
    if [ -d "$1" ]; then
        echo -e "${GREEN}✓${NC} $1 exists"
        return 0
    else
        echo -e "${RED}✗${NC} $1 does not exist"
        return 1
    fi
}

# Function to check if a script is executable
check_executable() {
    if [ -x "$1" ]; then
        echo -e "${GREEN}✓${NC} $1 is executable"
        return 0
    else
        echo -e "${RED}✗${NC} $1 is not executable"
        return 1
    fi
}

# Function to check GitHub auth
check_github_auth() {
    if gh auth status &> /dev/null; then
        echo -e "${GREEN}✓${NC} GitHub CLI is authenticated"
        return 0
    else
        echo -e "${RED}✗${NC} GitHub CLI is not authenticated. Run 'gh auth login'"
        return 1
    fi
}

# Function to check version files match
check_versions_consistent() {
    local has_mismatch=0
    local expected_version=""
    local current_step="unknown"
    
    echo "Checking version consistency across all release artifacts..."
    
    # Step 1: Check Info.plist versions
    current_step="Info.plist"
    local info_version=$(/usr/libexec/PlistBuddy -c "Print CFBundleVersion" "${INFOPLIST_FILE}" 2>/dev/null)
    local marketing_version=$(/usr/libexec/PlistBuddy -c "Print CFBundleShortVersionString" "${INFOPLIST_FILE}" 2>/dev/null)
    
    if [ -z "$info_version" ] || [ -z "$marketing_version" ]; then
        echo -e "${RED}✗${NC} Could not read version from Info.plist"
        return 1
    fi
    
    expected_version=$info_version
    echo -e "${BLUE}Current version from Info.plist: $expected_version${NC}"
    
    if [ "$info_version" != "$marketing_version" ]; then
        echo -e "${RED}✗${NC} Version mismatch in Info.plist:"
        echo "  CFBundleVersion: $info_version"
        echo "  CFBundleShortVersionString: $marketing_version"
        has_mismatch=1
    else
        echo -e "${GREEN}✓${NC} Info.plist versions match ($info_version)"
    fi
    
    # Step 2: Check project.pbxproj version
    current_step="Xcode project"
    local pbxproj_path="$PROJECT_DIR/$PROJECT_NAME.xcodeproj/project.pbxproj"
    if [ -f "$pbxproj_path" ]; then
        local pbxproj_version=$(sed -n '/MARKETING_VERSION/{s/MARKETING_VERSION = //;s/;//;s/^[[:space:]]*//;p;q;}' "$pbxproj_path" 2>/dev/null)
        if [ "$pbxproj_version" != "$expected_version" ]; then
            echo -e "${RED}✗${NC} Version mismatch in project.pbxproj:"
            echo "  Expected: $expected_version"
            echo "  Found: $pbxproj_version"
            has_mismatch=1
        else
            echo -e "${GREEN}✓${NC} Xcode project version matches ($pbxproj_version)"
        fi
    fi
    
    # Step 3: Check CHANGELOG.md
    current_step="CHANGELOG"
    if [ -f "$CHANGELOG_FILE" ]; then
        if ! grep -q "^# $expected_version" "$CHANGELOG_FILE"; then
            echo -e "${RED}✗${NC} Version $expected_version not found in CHANGELOG.md"
            echo "  Latest versions in CHANGELOG:"
            grep "^# " "$CHANGELOG_FILE" | head -n 3
            has_mismatch=1
        else
            echo -e "${GREEN}✓${NC} CHANGELOG.md has entry for version $expected_version"
        fi
    fi
    
    # Step 4: Check GitHub releases
    current_step="GitHub releases"
    if gh auth status &> /dev/null; then
        local latest_release=$(cd "$PROJECT_DIR" && gh release list --limit 1 | awk '{print $1}')
        if [ -n "$latest_release" ]; then
            if [ "$latest_release" = "$expected_version" ]; then
                echo -e "${GREEN}✓${NC} Warning: Version $expected_version already has a GitHub release"
            else
                echo -e "${YELLOW}!${NC} GitHub latest release ($latest_release) differs from current version ($expected_version)"
            fi
        fi
    fi
    
    # Step 5: Check appcast.xml
    current_step="Appcast"
    if [ -f "$APPCAST_FILE" ]; then
        local latest_appcast_version=$(grep -o '<sparkle:version>[^<]*</sparkle:version>' "$APPCAST_FILE" | head -n 1 | sed 's/<sparkle:version>\(.*\)<\/sparkle:version>/\1/')
        if [ -n "$latest_appcast_version" ]; then
            if [ "$latest_appcast_version" = "$expected_version" ]; then
                echo -e "${GREEN}✓${NC} Warning: Version $expected_version already in appcast.xml"
            else
                echo -e "${YELLOW}!${NC} Appcast latest version ($latest_appcast_version) differs from current version ($expected_version)"
            fi
        fi
    fi
    
    # Step 6: Check exported app
    current_step="Exported app"
    local folder_name="${PROJECT_NAME}.$expected_version"
    local app_path="$PRODUCT_DIR/$folder_name/$PROJECT_NAME.app"
    local dmg_path="$PRODUCT_DIR/$folder_name/$PROJECT_NAME.dmg"
    
    if [ -d "$app_path" ]; then
        local app_version=$(/usr/libexec/PlistBuddy -c "Print CFBundleVersion" "$app_path/Contents/Info.plist" 2>/dev/null)
        if [ "$app_version" != "$expected_version" ]; then
            echo -e "${RED}✗${NC} Exported app version mismatch:"
            echo "  Expected: $expected_version"
            echo "  Found: $app_version"
            has_mismatch=1
        else
            echo -e "${GREEN}✓${NC} Exported app version matches ($app_version)"
        fi
    else
        echo -e "${BLUE}i${NC} No exported app found for version $expected_version"
    fi
    
    # Step 7: Check DMG
    current_step="DMG"
    if [ -f "$dmg_path" ]; then
        echo -e "${GREEN}✓${NC} DMG exists for version $expected_version"
    else
        echo -e "${BLUE}i${NC} No DMG found for version $expected_version"
    fi
    
    if [ $has_mismatch -eq 1 ]; then
        echo -e "\n${RED}✗${NC} Version inconsistencies found!"
        return 1
    else
        echo -e "\n${GREEN}✓${NC} All version checks passed for $expected_version"
        return 0
    fi
}

# Function to check if Sparkle is properly setup
check_sparkle_setup() {
    # Check for sign_update tool
    local sign_update=$(find ~/Library/Developer/Xcode/DerivedData -name "SalatTimeBar*" -type d -exec find {} -name "sign_update" \; | grep "/bin/sign_update$" | grep -v "old_dsa_scripts" | head -n 1)
    
    if [ -x "$sign_update" ]; then
        echo -e "${GREEN}✓${NC} Sparkle sign_update tool found at $sign_update"
        return 0
    else
        echo -e "${RED}✗${NC} Sparkle sign_update tool not found"
        echo "  Make sure Sparkle framework is added to the project and was built at least once"
        return 1
    fi
}

# Function to check appcast.xml
check_appcast() {
    if [ -f "$APPCAST_FILE" ]; then
        # Check if appcast.xml is valid XML
        if xmllint --noout "$APPCAST_FILE" 2>/dev/null; then
            echo -e "${GREEN}✓${NC} appcast.xml is valid XML"
            
            # Count number of releases in appcast
            local release_count=$(grep -c "<item>" "$APPCAST_FILE")
            if [ $release_count -gt 0 ]; then
                echo -e "${GREEN}✓${NC} appcast.xml contains $release_count release(s)"
            else
                echo -e "${YELLOW}!${NC} appcast.xml does not contain any releases"
            fi
            return 0
        else
            echo -e "${RED}✗${NC} appcast.xml is not valid XML"
            return 1
        fi
    else
        echo -e "${RED}✗${NC} appcast.xml does not exist at $APPCAST_FILE"
        return 1
    fi
}

# Function to check for create-dmg tool
check_create_dmg() {
    if command -v create-dmg &> /dev/null; then
        echo -e "${GREEN}✓${NC} create-dmg is available"
        return 0
    else
        echo -e "${RED}✗${NC} create-dmg is not installed"
        echo "  Install with: brew install create-dmg"
        return 1
    fi
}

# Function to check CHANGELOG.md format
check_changelog() {
    if [ -f "$CHANGELOG_FILE" ]; then
        # Check that CHANGELOG.md follows the expected format
        if grep -q "^# [0-9]\+\.[0-9]\+\.[0-9]\+" "$CHANGELOG_FILE" && grep -q "^---" "$CHANGELOG_FILE"; then
            echo -e "${GREEN}✓${NC} CHANGELOG.md follows the expected format"
            
            # Get the current version
            local current_version=$(/usr/libexec/PlistBuddy -c "Print CFBundleVersion" "${PROJECT_DIR}/${INFOPLIST_FILE}" 2>/dev/null)
            
            # Check if the current version is in the CHANGELOG
            if grep -q "^# $current_version" "$CHANGELOG_FILE"; then
                echo -e "${GREEN}✓${NC} Current version $current_version is in CHANGELOG.md"
            else
                echo -e "${YELLOW}!${NC} Current version $current_version is not in CHANGELOG.md"
                echo "  You should add an entry for version $current_version before release"
            fi
            return 0
        else
            echo -e "${RED}✗${NC} CHANGELOG.md does not follow the expected format"
            echo "  Expected format is:"
            echo "  # x.y.z"
            echo "  - Change 1"
            echo "  - Change 2"
            echo "  ---"
            return 1
        fi
    else
        echo -e "${RED}✗${NC} CHANGELOG.md does not exist at $CHANGELOG_FILE"
        return 1
    fi
}

# Function to check GitHub releases
check_github_releases() {
    # Check if gh is authenticated
    if ! gh auth status &> /dev/null; then
        echo -e "${RED}✗${NC} GitHub CLI is not authenticated"
        return 1
    fi
    
    # Get current version
    local current_version=$(/usr/libexec/PlistBuddy -c "Print CFBundleVersion" "${PROJECT_DIR}/${INFOPLIST_FILE}" 2>/dev/null)
    
    # List releases
    echo -e "${BLUE}i${NC} GitHub releases:"
    releases=$(cd "$PROJECT_DIR" && gh release list --limit 5)
    echo "$releases"
    
    # Check if current version already has a release
    if echo "$releases" | grep -q "^$current_version"; then
        echo -e "${YELLOW}!${NC} Current version $current_version already has a GitHub release"
    else
        echo -e "${GREEN}✓${NC} Current version $current_version does not have a GitHub release yet"
    fi
    
    return 0
}

# Function to check for exported apps
check_exported_apps() {
    # Get current version
    local current_version=$(/usr/libexec/PlistBuddy -c "Print CFBundleVersion" "${PROJECT_DIR}/${INFOPLIST_FILE}" 2>/dev/null)
    local folder_name="${PROJECT_NAME}.$current_version"
    local app_path="$PRODUCT_DIR/$folder_name/$PROJECT_NAME.app"
    local dmg_path="$PRODUCT_DIR/$folder_name/$PROJECT_NAME.dmg"
    
    # Check for exported app
    if [ -d "$app_path" ]; then
        echo -e "${GREEN}✓${NC} Exported app found at $app_path"
        
        # Check app is signed and notarized
        if codesign -dv --verbose=2 "$app_path" 2>&1 | grep -q "Authority=Developer ID Application:"; then
            echo -e "${GREEN}✓${NC} App is signed with Developer ID"
            
            if codesign -dv --verbose=2 "$app_path" 2>&1 | grep -q "Notarization"; then
                echo -e "${GREEN}✓${NC} App appears to be notarized"
            else
                echo -e "${YELLOW}!${NC} App doesn't appear to be notarized"
            fi
        else
            echo -e "${RED}✗${NC} App is not signed with Developer ID"
        fi
    else
        echo -e "${YELLOW}!${NC} Exported app not found at $app_path"
        echo "  You need to export the app from Xcode before creating a release"
    fi
    
    # Check for DMG
    if [ -f "$dmg_path" ]; then
        echo -e "${GREEN}✓${NC} DMG found at $dmg_path"
    else
        echo -e "${YELLOW}!${NC} DMG not found at $dmg_path"
        echo "  Run './scripts/release.sh' to create it"
    fi
}

# Main function
main() {
    echo -e "${BLUE}=== SalatTimeBar Release Doctor ===${NC}"
    echo "Checking your release setup..."
    echo
    
    echo -e "${BLUE}=== Environment Checks ===${NC}"
    check_command "gh" || echo "  Install GitHub CLI with: brew install gh"
    check_command "jq" || echo "  Install jq with: brew install jq"
    check_command "xmllint" || echo "  Install xmllint with: brew install libxml2"
    check_create_dmg
    echo
    
    echo -e "${BLUE}=== Project Structure Checks ===${NC}"
    check_directory "$PROJECT_DIR"
    check_file "$PROJECT_DIR/$INFOPLIST_FILE"
    check_directory "$SCRIPTS_DIR"
    check_file "$PROJECT_DIR/$PROJECT_NAME.xcodeproj/project.pbxproj"
    echo
    
    echo -e "${BLUE}=== Script Checks ===${NC}"
    check_file "$SCRIPTS_DIR/bump_build.sh" && check_executable "$SCRIPTS_DIR/bump_build.sh"
    check_file "$SCRIPTS_DIR/release.sh" && check_executable "$SCRIPTS_DIR/release.sh"
    check_file "$SCRIPTS_DIR/extract_release_notes.sh" && check_executable "$SCRIPTS_DIR/extract_release_notes.sh"
    check_file "$SCRIPTS_DIR/sign_dmg.sh" && check_executable "$SCRIPTS_DIR/sign_dmg.sh"
    check_file "$SCRIPTS_DIR/create_github_release.sh" && check_executable "$SCRIPTS_DIR/create_github_release.sh"
    check_file "$SCRIPTS_DIR/generate_appcast.sh" && check_executable "$SCRIPTS_DIR/generate_appcast.sh"
    check_file "$SCRIPTS_DIR/release_manager.sh" && check_executable "$SCRIPTS_DIR/release_manager.sh"
    echo
    
    echo -e "${BLUE}=== Version Checks ===${NC}"
    check_versions_consistent
    echo
    
    echo -e "${BLUE}=== CHANGELOG Checks ===${NC}"
    check_changelog
    echo
    
    echo -e "${BLUE}=== Sparkle Checks ===${NC}"
    check_sparkle_setup
    check_appcast
    echo
    
    echo -e "${BLUE}=== GitHub Checks ===${NC}"
    check_github_auth
    check_github_releases
    echo
    
    echo -e "${BLUE}=== Build Artifact Checks ===${NC}"
    check_exported_apps
    echo
    
    echo -e "${BLUE}=== Summary ===${NC}"
    if [ $FAILURES -eq 0 ]; then
        echo -e "${GREEN}All checks passed! You're ready to release.${NC}"
        echo "Run './scripts/release_manager.sh [major|minor|patch]' to start the release process."
    else
        echo -e "${RED}$FAILURES checks failed. Please fix the issues before releasing.${NC}"
    fi
}

# Counter for failures
FAILURES=0

# Helper function to record failures
run_check() {
    $1
    if [ $? -ne 0 ]; then
        FAILURES=$((FAILURES + 1))
    fi
}

main 