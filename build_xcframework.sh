#!/bin/zsh

# Exit immediately if a command exits with a non-zero status.
set -e

# --- Configuration ---
PROJECT_NAME="Consent String SDK Swift.xcodeproj"
SCHEME_NAME="Consent String SDK Swift"
CONFIGURATION="Release"
FRAMEWORK_NAME="Consent_String_SDK_Swift"

# --- Paths ---
BUILD_DIR="build"
FRAMEWORK_OUTPUT_PATH="${BUILD_DIR}/${FRAMEWORK_NAME}.xcframework"
ARCHIVE_PATH_IOS_DEVICE="${BUILD_DIR}/archives/${SCHEME_NAME}-iOS"
ARCHIVE_PATH_IOS_SIMULATOR="${BUILD_DIR}/archives/${SCHEME_NAME}-iOS_Simulator"

# --- Clean ---
echo "🧹 Cleaning previous builds..."
rm -rf "${BUILD_DIR}"
mkdir -p "${BUILD_DIR}/archives"

# --- Build Archive for iOS Devices ---
echo "📦 Archiving for iOS devices..."
xcodebuild archive \
    -project "${PROJECT_NAME}" \
    -scheme "${SCHEME_NAME}" \
    -configuration "${CONFIGURATION}" \
    -destination "generic/platform=iOS" \
    -archivePath "${ARCHIVE_PATH_IOS_DEVICE}" \
    SKIP_INSTALL=NO \
    BUILD_LIBRARY_FOR_DISTRIBUTION=YES

# --- Build Archive for iOS Simulators ---
echo "📦 Archiving for iOS simulators..."
xcodebuild archive \
    -project "${PROJECT_NAME}" \
    -scheme "${SCHEME_NAME}" \
    -configuration "${CONFIGURATION}" \
    -destination "generic/platform=iOS Simulator" \
    -archivePath "${ARCHIVE_PATH_IOS_SIMULATOR}" \
    SKIP_INSTALL=NO \
    BUILD_LIBRARY_FOR_DISTRIBUTION=YES

# --- Create XCFramework ---
echo "🧬 Creating XCFramework..."
xcodebuild -create-xcframework \
    -framework "${ARCHIVE_PATH_IOS_DEVICE}.xcarchive/Products/Library/Frameworks/${FRAMEWORK_NAME}.framework" \
    -framework "${ARCHIVE_PATH_IOS_SIMULATOR}.xcarchive/Products/Library/Frameworks/${FRAMEWORK_NAME}.framework" \
    -output "${FRAMEWORK_OUTPUT_PATH}"

# --- Cleanup Archives ---
echo "🗑️ Cleaning up archives..."
rm -rf "${BUILD_DIR}/archives"

echo "✅ Successfully created ${FRAMEWORK_OUTPUT_PATH}"

exit 0
