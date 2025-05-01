{ config, pkgs, ... }:

{
    imports = [
        ../../modules/desktop/gnome.nix

        ../../modules/core.nix
    ];

    environment.systemPackages = with pkgs; [
    ];
}