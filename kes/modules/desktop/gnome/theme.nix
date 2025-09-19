{ pkgs, ... }:
{
    home-manager.sharedModules = [
        ./theme.home.nix
    ];

    environment.systemPackages = with pkgs; [
        catppuccin-cursors
    ];
}
