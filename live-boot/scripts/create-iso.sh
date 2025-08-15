#! /usr/bin/env bash

script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
flake_path=$(realpath "$script_dir/../devices/live-boot")

output_dir="$script_dir"
if [ -n "$1" ]; then
    output_dir="$1"
fi

mkdir -p "$output_dir" || exit 1

cd "$script_dir" >/dev/null || exit 1
echo "using flake from $flake_path"
echo "writing iso file - this might take a while"

rm result 2>/dev/null
rm -rf result 2>/dev/null

nix build "$flake_path#nixosConfigurations.nixos.config.system.build.isoImage" || exit 1

iso_files=(result/iso/*.iso)

created_file=${iso_files[0]}

cp "$created_file" "$output_dir" -f
rm result

copied_file=$(basename "$created_file")
absolute_path=$(realpath "$output_dir/$copied_file")

echo "written to $absolute_path"

cd - >/dev/null || exit 1