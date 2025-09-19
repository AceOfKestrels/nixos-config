{ pkgs, ... }:

{
    # Import core modules
    imports = [
        ./core/git.nix # Git
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
        chromium

        keepassxc
        nextcloud-client
        localsend

        nix-search-cli # Search Nix packages via CLI
        nixfmt-rfc-style # Formatter for nix files

        vesktop # Discord
        signal-desktop-bin # Signal messenger

        dig # to have dns tools like nslookup

        veracrypt # To Encrypt External Media for Cros Platform use

    ];

    environment.variables = {
        NIXOS_CONFIG_PATH = "/etc/nixos/nixos-config";
        COMMIT_FLAKE_LOCK = 1;
    };

    environment.shellAliases = {
        edit-config = "code $NIXOS_CONFIG_PATH";
        flake-rebuild = "sudo nixos-rebuild $@ --flake $FLAKE_PATH";
    };

    programs.nh.enable = true;
    nixpkgs.config.allowUnfree = true;
}
