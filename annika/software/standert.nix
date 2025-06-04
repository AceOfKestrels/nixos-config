{ config, pkgs, ... }:

{
    environment.systemPackages = with pkgs; [
        discord # Install Official Discord app
        google-chrome # Install google chrom
        plex # Install Plex
        protonmail-desktop # Install Proton Mail
        termius # SSH Client
    ];
}
