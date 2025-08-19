#! /usr/bin/env bash

script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

if ! [[ "$script_dir" = "/etc/nixos/nixos-config" ]]; then
    echo "warning: nixos-config is not in /etc/nixos/nixos_config"
fi

if [ -z "$1" ] || ! [ -d "$1" ] || ! [ -f "$1/flake.nix" ]; then
    echo "usage: build.sh <flake_path> [config_name]"
    echo
    echo "available flakes:"
    git ls-files --full-name -- '*/flake.nix' \
        | xargs -r -n1 dirname \
        | sort -u \
        | sed "s|^|$(git rev-parse --show-toplevel)/|"
    exit 1
fi

available_configs=$(nix eval "$1"#nixosConfigurations --apply 'x: builtins.concatStringsSep "\n" (builtins.attrNames x)' --raw 2>/dev/null)

selected_config="${available_configs[0]}"
if [ -n "$2" ]; then
    selected_config="$2";
fi

if ! [[ "$selected_config" = *"$available_configs"* ]]; then
    echo "fatal: unknown config: \"$selected_config\" - available options are:"
    echo "$available_configs"
    exit 1
fi

export FLAKE_PATH="$script_dir"
sudo nixos-rebuild switch --flake "$FLAKE_PATH#$selected_config"