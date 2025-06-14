#! /bin/sh

sleep 60
cd "$NIXOS_CONFIG_DIR"
git fetch --prune
git reset --hard "origin/$NIXOS_CONFIG_REMOTE_BRANCH"
nix-channel --add "$NIXOS_CONFIG_CHANNEL" nixos 
nixos-rebuild switch --upgrade