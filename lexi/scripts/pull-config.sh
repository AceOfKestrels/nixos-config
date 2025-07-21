#! /bin/sh

cd "$NIXOS_CONFIG_DIR" || exit 1
git fetch --prune
git clean -fd
git restore .
git reset --hard "origin/$NIXOS_CONFIG_REMOTE_BRANCH"