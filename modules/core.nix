{
    kestrel,
    pkgs,
    lib,
    ...
}:

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
    ]
    ++ kestrel.userModules {
        kes = ./core.kes.nix;
        annika = ./core.annika.nix;
    };

    nixpkgs.config.allowInsecurePredicate = lib.mkDefault (_: true);

    # Include core packages
    environment.systemPackages = with pkgs; [
        firefox-devedition
        chromium

        wine

        keepassxc
        nextcloud-client
        localsend

        nix-search-cli # Search Nix packages via CLI
        nixfmt-rfc-style # Formatter for nix files

        vesktop # Discord
        signal-desktop-bin # Signal messenger

        dig # to have dns tools like nslookup

        veracrypt # To Encrypt External Media for Cros Platform use

        jellyflix # To use Jellyfin with proper hardware acceleration
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

    nixpkgs.overlays = kestrel.overlays.mkOverlays {
        nextcloud-client = "8eaee110344796db060382e15d3af0a9fc396e0e";
        jellyflix = "7a5400ad45bd64c5de63dfcde0035b8bcce7e73a";
    };
}
