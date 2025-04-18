{ config, pkgs, ... }:

{
    imports = [
        # Remember to add a DE
        # ./modules/desktop/gnome.nix
        ./modules/desktop/kde-plasma.nix

        ./modules/core.nix

        ./modules/development/docker.nix
        ./modules/development/dotnet.nix
    ];

    environment.systemPackages = with pkgs; [
        figma-linux
        kitty
    ];
}