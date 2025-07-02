#! /bin/sh

cd "$NIXOS_CONFIG_DIR"
git fetch --prune
git reset --hard "origin/$NIXOS_CONFIG_REMOTE_BRANCH"