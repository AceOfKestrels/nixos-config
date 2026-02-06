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

        # Security Modules
        ./security/clamav.nix # Import Anti virus
        ./security/firewall.nix # Import Firewall Config
        ./security/sudo.nix # Import Sudo Replacment Nix File
        ./security/apparmor.nix # Import App armor

        # Import Utility Stuff
        ./utility/rsync.nix

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
        nextcloud-talk-desktop
        localsend

        nix-search-cli # Search Nix packages via CLI
        nixfmt # Formatter for nix files

        signal-desktop-bin # Signal messenger

        dig # to have dns tools like nslookup

        veracrypt # To Encrypt External Media for Cros Platform use

        jellyfin-desktop # To use Jellyfin with proper hardware acceleration
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
        vesktop = "be3ce565ff3d24d9c0a54763f0ba0a1cc5f0c337"; # Pin to stabel
    };
}
