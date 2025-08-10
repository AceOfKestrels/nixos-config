{ pkgs, ... }:
{
    home-manager.sharedModules = [
        ./theme.gnome.home.nix
    ];

    environment.systemPackages = with pkgs; [
        catppuccin
        catppuccin-cursors
        magnetic-catppuccin-gtk
    ];
}
