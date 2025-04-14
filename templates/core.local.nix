{ config, pkgs, ... }:

{
    environment.variables = {
        # Change to the actual location where you cloned the repository
        KES_NIX_CONFIGS_DIR = "/home/kes/nixos-config";
    };
}