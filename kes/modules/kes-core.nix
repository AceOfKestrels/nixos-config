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
    ];

    environment.systemPackages = with pkgs; [
    ];

    environment.variables = {
	    GIT_BROWSER = "firefox-devedition";
        SEARCH_BROWSER = "firefox-devedition";
        SEARCH_BROWSER_ARGS = "--searchg";
    };
}
