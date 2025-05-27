{ config, pkgs, ... }:

{
    # Import core modules
    imports = [
        ../local/core.local.nix

        ./core/git.nix # Git
        ./core/office.nix # OnlyOffice, Image Editors, Fonts
        ./core/vscode.nix # VS Code / VSCodium
        ./core/zsh.nix # ZSH
        ./core/shell-sources.nix # shell sources
        ./core/garbage-collect.nix # Deleat old nix stuff
    ];

    # Include core packages
    environment.systemPackages = with pkgs; [
        firefox-devedition

        keepassxc
        nextcloud-client

        nix-search-cli # Search Nix packages via CLI

        vesktop # Discord
        signal-desktop-bin # Signal messenger

        dig # to have dns tools like nslookup
    ];
}