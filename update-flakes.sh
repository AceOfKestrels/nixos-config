#! /usr/bin/env bash

script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

cd "$script_dir" || exit 1
flakes=$(git ls-files --full-name -- '*/flake.nix' | xargs -r -n1 dirname)
cd - > /dev/null || exit 1

for flake in $flakes ;
do
    # shellcheck disable=SC2068
    nix flake update --flake "$script_dir/$flake" $@
done