{ config, pkgs, ... }:

{
    imports = [
        ../../modules/desktop/kde-plasma.nix

        ../../modules/core.nix

        ../../modules/development/docker.nix
        ../../modules/development/dotnet.nix
        ../../modules/development/webdev.nix
        ../../modules/development/wireguard.nix

        ../overrides/git-nvim.nix

        ./core/locale.nix
        ./core/pipewire.nix
    ];

    environment.systemPackages = with pkgs; [
    ];

    environment.variables = {
	    GIT_BROWSER = "firefox-devedition";
        SEARCH_BROWSER = "firefox-devedition";
        SEARCH_BROWSER_ARGS = "--searchg";
    };

    nixpkgs.config.allowUnfree = true;
    networking.networkmanager.enable = true;

    boot.loader.systemd-boot.enable = true;
    boot.loader.efi.canTouchEfiVariables = true;

    services.xserver.enable = true;

    services.printing.enable = true;
}
