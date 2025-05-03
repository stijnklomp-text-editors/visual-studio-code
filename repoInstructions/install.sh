#!/bin/bash

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Path to storage.json
STORAGE_FILE="${SCRIPT_DIR}/../User/globalStorage/storage.json"

# New profile to add (as jq-compatible JSON)
NEW_PROFILE='{
    "location": "2995f3e4",
    "name": "backend-typescript",
    "icon": "server",
    "useDefaultFlags": {
        "keybindings": true,
        "tasks": true
    }
}'

# Check if storage.json exists, if not, create it with the new profile
if [ ! -f "$STORAGE_FILE" ]; then
    mkdir -p "$(dirname \"$STORAGE_FILE\")"
    echo "{\"userDataProfiles\": [${NEW_PROFILE}]}" > "$STORAGE_FILE"
    echo "Created storage.json with the new profile."
    exit 0
fi

# Merge logic using jq
TMP_FILE=$(mktemp)

jq --argjson newProfile "$NEW_PROFILE" '
    .userDataProfiles += (
        if .userDataProfiles then
            if (.userDataProfiles | map(select((.location == $newProfile.location) or (.name == $newProfile.name))) | length) == 0 then
                [$newProfile]
            else
                []
            end
        else
            [$newProfile]
        end
    )
' "$STORAGE_FILE" > "$TMP_FILE" && mv "$TMP_FILE" "$STORAGE_FILE"

echo "Profiles updated successfully."
