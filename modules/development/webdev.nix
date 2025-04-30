{ config, pkgs, ... }:

{
    environment.systemPackages = with pkgs; [
        jetbrains.webstorm

        nodejs

        # Browser version is quicker and more stable
        # figma-linux
    ];
}