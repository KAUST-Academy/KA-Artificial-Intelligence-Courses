#!/bin/bash

VERSION_FILE="VERSION"

# Read the current version or initialize if not found
if [ ! -f "$VERSION_FILE" ]; then
    echo "0.0.0" > "$VERSION_FILE"
fi
CURRENT_VERSION=$(cat "$VERSION_FILE")

# Split version into components
IFS='.' read -r MAJOR MINOR PATCH <<< "$CURRENT_VERSION"

# Determine what to increment based on argument
case "$1" in
    major)
        MAJOR=$((MAJOR + 1))
        MINOR=0
        PATCH=0
        ;;
    minor)
        MINOR=$((MINOR + 1))
        PATCH=0
        ;;
    patch|"" )
        PATCH=$((PATCH + 1))
        ;;
    *)
        echo "Usage: $0 [major|minor|patch]"
        exit 1
        ;;
esac

# Assemble new version
NEW_VERSION="$MAJOR.$MINOR.$PATCH"

# Update the VERSION file
echo "$NEW_VERSION" > "$VERSION_FILE"

echo "Updated version: $NEW_VERSION"
