#!/bin/bash
tarball="custom-distro-arm64.tar.gz"
target_dir="rootfs"

echo "Extracting tarball..."
mkdir -p "$target_dir"
sudo tar -xzvf "$tarball" -C "$target_dir"

echo "Entering chroot environment..."
sudo chroot "$target_dir" /bin/bash
