{ ... }:

{
    environment.variables = {
        NIXOS_CONFIG_PATH = "/etc/nixos/nixos-config";
        COMMIT_FLAKE_LOCK = 1;
        NIXPKGS_ALLOW_UNFREE = 1;
    };
}
