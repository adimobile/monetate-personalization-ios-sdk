#!/bin/bash

CONFIGURATION=${1:-Release}
set -euo pipefail


echo "Build configuration: $CONFIGURATION"
if [ "$CONFIGURATION" == "Debug" ]; then
  EXTRA_FLAGS='SWIFT_ACTIVE_COMPILATION_CONDITIONS=DEBUG'
else
  EXTRA_FLAGS=''
fi

# Clean build folder
BUILD_DIR="./build"
rm -rf "$BUILD_DIR"
mkdir -p "$BUILD_DIR"

echo "Building device archive..."
xcodebuild archive \
  -project monetate-ios-sdk.xcodeproj \
  -scheme monetate-ios-sdk-release \
  -configuration "$CONFIGURATION" \
  -destination "generic/platform=iOS" \
  -archivePath "$BUILD_DIR/ios_devices.xcarchive" \
  SKIP_INSTALL=NO \
  BUILD_LIBRARY_FOR_DISTRIBUTION=YES \
  ONLY_ACTIVE_ARCH=NO \
  $EXTRA_FLAGS
  
  

echo "Building simulator archive..."
xcodebuild archive \
  -project monetate-ios-sdk.xcodeproj \
  -scheme monetate-ios-sdk-release \
  -configuration "$CONFIGURATION" \
  -destination "generic/platform=iOS Simulator" \
  -archivePath "$BUILD_DIR/ios_simulator.xcarchive" \
  SKIP_INSTALL=NO \
  BUILD_LIBRARY_FOR_DISTRIBUTION=YES \
  ONLY_ACTIVE_ARCH=NO \
  $EXTRA_FLAGS
  
  # Framework paths
DEV_FW="$BUILD_DIR/ios_devices.xcarchive/Products/Library/Frameworks/Monetate.framework"
SIM_FW="$BUILD_DIR/ios_simulator.xcarchive/Products/Library/Frameworks/Monetate.framework"

echo "Verifying build outputs..."
if [[ ! -d "$DEV_FW" ]]; then
  echo "Missing device framework: $DEV_FW"
  exit 1
fi

if [[ ! -d "$SIM_FW" ]]; then
  echo "Missing simulator framework: $SIM_FW"
  exit 1
fi

echo "Creating XCFramework..."
xcodebuild -create-xcframework \
  -framework "$DEV_FW" \
  -framework "$SIM_FW" \
  -output "$BUILD_DIR/Monetate.xcframework"

echo "✅ $CONFIGURATION XCFramework created successfully!"

echo "Zipping XCFramework..."
(cd "$BUILD_DIR" && zip -r -X "Monetate.xcframework.zip" "Monetate.xcframework")

echo "✅ Done: $BUILD_DIR/Monetate.xcframework.zip"



