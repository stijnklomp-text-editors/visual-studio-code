#!/bin/bash

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

STORAGE_DIR="${SCRIPT_DIR}/../User/"

mv "${SCRIPT_DIR}/User/profiles/*" "${STORAGE_DIR}/profiles/*"
