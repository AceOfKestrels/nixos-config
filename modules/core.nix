{ config, pkgs, ... }:

{
    # Import core modules
    imports = [
        ./core/git.nix # Git
        ./core/office.nix # OnlyOffice, Image Editors, Fonts
        ./core/vscode.nix # VS Code / VSCodium
        ./core/zsh.nix # ZSH
    ];

    # Include core packages
    environment.systemPackages = with pkgs; [
        firefox-devedition

        keepassxc
        nextcloud-client

        nix-search-cli # Search Nix packages via CLI

        vesktop # Discord
        signal-desktop # Signal messenger
    ];
}