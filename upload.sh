#!/bin/bash

set -euo pipefail

# =========================
# CONFIG
# =========================
BUILD_DIR="./build"

JFROG_REPO="monetate-ios-local-dev"
JFROG_BASE_URL="https://monetate.jfrog.io/artifactory"

SDK_NAME="Monetate"
VERSION="2026.04.29"

FILE="${BUILD_DIR}/${SDK_NAME}.xcframework.zip"
FILE_NAME="$(basename "$FILE")"

UPLOAD_PATH="${JFROG_REPO}/${SDK_NAME}/${VERSION}"

URL="${JFROG_BASE_URL}/${UPLOAD_PATH}/${FILE_NAME}"


# =========================
# CHECK FILES
# =========================
if [ ! -f "$FILE" ]; then
  echo "❌ Missing file: $FILE"
  exit 1
fi

# =========================
# UPLOAD XCFRAMEWORK
# =========================
echo "Uploading XCFramework..."
jfrog rt upload "$FILE" "$UPLOAD_PATH/" --flat=true

# =========================
# GENERATE SPM CHECKSUM (LOCAL FILE)
# =========================
echo "Generating Swift Package checksum..."
CHECKSUM=$(swift package compute-checksum "$FILE")


# =========================
# OUTPUT RESULTS
# =========================

echo "=================================="
echo "✅ UPLOAD COMPLETE ${VERSION}"
echo "=================================="

# =========================
# PACKAGE.SWIFT SNIPPET
# =========================
cat <<EOF
.binaryTarget(
    name: "$SDK_NAME",
    url: "$URL",
    checksum: "$CHECKSUM"
)
EOF
