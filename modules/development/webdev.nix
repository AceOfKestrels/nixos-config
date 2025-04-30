{ config, pkgs, ... }:

{
    environment.systemPackages = with pkgs; [
        jetbrains.webstorm

        nodejs

        figma-linux
    ];
}