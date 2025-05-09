{ config, pkgs, ... }:

{
    imports = [
        ../modules/kes-core.nix
    ];

    environment.systemPackages = with pkgs; [
    ];
}