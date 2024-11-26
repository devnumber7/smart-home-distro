#!/bin/bash

# Helper script for building and modifying the tarball for OS setup

set -e  # Exit on any error

# Function to reassemble the tarball
reassemble_tarball() {
    if ls part_* 1> /dev/null 2>&1; then
        echo "Reassembling tarball from parts..."
        cat part_* > smart-distro-arm64.tar.gz
        echo "Reassembly complete: smart-distro-arm64.tar.gz"
    else
        echo "No split parts found. Skipping reassembly."
    fi
}

# Function to extract the tarball
extract_tarball() {
    if [ -f "smart-distro-arm64.tar.gz" ]; then
        echo "Extracting smart-distro-arm64.tar.gz..."
        tar -xzvf smart-distro-arm64.tar.gz
        echo "Extraction complete."
    else
        echo "Error: smart-distro-arm64.tar.gz not found!"
        exit 1
    fi
}

# Function to rebuild the tarball
rebuild_tarball() {
    if [ -d "smart-distro-arm64" ]; then
        echo "Rebuilding tarball..."
        tar -czvf smart-distro-arm64.tar.gz smart-distro-arm64
        echo "Rebuild complete: smart-distro-arm64.tar.gz"
    else
        echo "Error: smart-distro-arm64 directory not found!"
        exit 1
    fi
}

# Function to provide modification instructions
os_mod_instructions() {
    echo "================ Modification Instructions ================"
    echo "1. Navigate to the extracted directory:"
    echo "   cd smart-distro-arm64"
    echo "2. Modify the necessary files or scripts."
    echo "3. Run this script with the --rebuild option to create an updated tarball."
    echo "=========================================================="
}

# Script usage
usage() {
    echo "Usage: $0 [--reassemble | --extract | --rebuild | --instructions]"
    echo "  --reassemble   Reassemble the tarball from split parts."
    echo "  --extract      Extract the tarball for modifications."
    echo "  --rebuild      Rebuild the tarball after modifications."
    echo "  --instructions Show modification instructions."
    exit 1
}

# Main logic
if [ $# -eq 0 ]; then
    usage
fi

for arg in "$@"; do
    case $arg in
        --reassemble)
            reassemble_tarball
            ;;
        --extract)
            extract_tarball
            ;;
        --rebuild)
            rebuild_tarball
            ;;
        --instructions)
            os_mod_instructions
            ;;
        *)
            usage
            ;;
    esac
done
