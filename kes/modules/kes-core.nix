{ lib, config, pkgs, ... }:

{
    nixpkgs.config.allowUnfree = true;
    nix.settings.experimental-features = [ "nix-command" "flakes" ];

    networking.networkmanager.enable = true;
    services.printing.enable = true;

    services.xserver.enable = true;

    boot.loader.systemd-boot.enable = true;
    boot.loader.efi.canTouchEfiVariables = true;

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
    };
}