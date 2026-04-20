#!/usr/bin/env bash
set -euo pipefail

REPO_URL="https://github.com/neovim/neovim.git"
TMP_DIR="$(mktemp -d /tmp/neovim-build-XXXXXX)"
trap 'rm -rf "$TMP_DIR"' EXIT

echo "==> Cloning neovim master into $TMP_DIR"
git clone --depth 1 --branch master "$REPO_URL" "$TMP_DIR"

echo "==> Building (Release)"
make -C "$TMP_DIR" CMAKE_BUILD_TYPE=Release

echo "==> Installing (may prompt for sudo)"
sudo make -C "$TMP_DIR" install

echo "==> Running headless plugin sync"
nvim --headless "+Lazy! sync" +qa

echo "==> Installed version:"
nvim --version | head -n 1
