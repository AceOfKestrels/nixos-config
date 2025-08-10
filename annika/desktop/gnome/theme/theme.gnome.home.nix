{ pkgs, ... }:
let
    gnome4x = import ./gnome4x/gnome4x-theme.nix { inherit pkgs; };
in
{
    gtk = {
        enable = true;
        theme = {
            name = "GNOME-4X-Magenta-Dark";
            package = gnome4x;
        };
    };

    dconf.settings = {
        "org/gnome/desktop/interface" = {

            gtk-theme = "GNOME-4X-Magenta-Dark";
            accent-color = "purple";
            color-scheme = "prefer-dark";

            enable-hot-corners = false;
            toolkit-accessibility = false;

            icon-theme = "Papirus";
            cursor-theme = "Adwaita";
        };
    };
}
