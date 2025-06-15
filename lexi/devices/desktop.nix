{ config, pkgs, ... }:

{
    imports = [
        ../modules/amdgpu.nix
        ../modules/auto-update.nix

        ../../modules/desktop/kde-plasma.nix

        ../../modules/core/office.nix
        ../../modules/core/garbage-collect.nix

        ../../modules/gaming/minecraft.nix
        ../../modules/gaming/steam.nix
    ];

    programs.git.enable = true;

    security.sudo.wheelNeedsPassword = false;

    environment.systemPackages = with pkgs; [
        firefox
        firefox-devedition

        discord
        vesktop

        neovim

        fastfetch
        hyfetch

        starsector
    ];
}