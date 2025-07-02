#! /bin/sh

nix-channel --add "$NIXOS_CONFIG_CHANNEL" nixos 
nix-channel --update
nixos-rebuild "$NIXOS_REBUILD_ACTION" \
    -I nixpkgs=/nix/var/nix/profiles/per-user/root/channels/nixos \
    -I "nixos-config=$NIXOS_SYSTEM_CONFIG"