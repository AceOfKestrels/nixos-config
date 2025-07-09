{ config, pkgs, ... }:

{
    # Import core modules
    imports = [./core/git.nix # Git
        ./core/nvim.nix # Neovim
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
        localsend

        nix-search-cli # Search Nix packages via CLI
        nixfmt-rfc-style # Formatter for nix files

        vesktop # Discord
        signal-desktop-bin # Signal messenger

        dig # to have dns tools like nslookup
    ];

    environment.variables.NIXOS_CONFIG_PATH = "/etc/nixos/nixos-config";

    environment.shellAliases = {
        edit-config = "code $NIXOS_CONFIG_PATH";
    };
}
