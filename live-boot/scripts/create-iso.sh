#! /usr/bin/env bash

script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
flake_path=$(realpath "$script_dir/../devices/live-boot")

config_name="live-boot"
if [ -n "$1" ]; then
    config_name="$1"
    available=$(nix eval "$flake_path"#nixosConfigurations --apply builtins.attrNames 2>/dev/null)
    if ! [[ "$available" = *"$config_name"* ]]; then
        echo "unknown config. available options are:"
        echo
        nix eval "$flake_path"#nixosConfigurations --apply 'x: builtins.concatStringsSep "\n" (builtins.attrNames x)' --raw 2>/dev/null
        exit 1
    fi
fi

output_dir="$script_dir"
if [ -n "$2" ]; then
    output_dir="$2"
fi

mkdir -p "$output_dir" || exit 1

cd "$script_dir" >/dev/null || exit 1
echo "using flake from $flake_path"
echo "writing iso file - this might take a while"

rm result 2>/dev/null
rm -rf result 2>/dev/null

nix build "$flake_path#nixosConfigurations.$config_name.config.system.build.isoImage" || exit 1

iso_files=(result/iso/*.iso)

created_file=${iso_files[0]}
file_name=$(basename "$created_file")

cp "$created_file" "$output_dir/$config_name-$file_name" -f
rm result

absolute_path=$(realpath "$output_dir/$file_name")

echo "written to $absolute_path"

cd - >/dev/null || exit 1