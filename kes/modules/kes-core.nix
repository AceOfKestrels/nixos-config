{ config, pkgs, ... }:

{
    imports = [
        ../../modules/desktop/kde-plasma.nix

        ../../modules/core.nix

        ../../modules/development/docker.nix
        ../../modules/development/dotnet.nix
        ../../modules/development/webdev.nix
    ];

    environment.systemPackages = with pkgs; [
    ];
}