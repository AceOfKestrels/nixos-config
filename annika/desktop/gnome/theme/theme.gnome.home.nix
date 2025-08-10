{ pkgs, ... }:

let
    catppuccinGTK = pkgs.magnetic-catppuccin-gtk.override {
        accent = [ "purple" ]; # list, even for one value
        shade = "dark"; # "light" or "dark"
        size = "compact"; # "standard" or "compact"
        tweaks = [ "black" ]; # optional tweaks: black, macos, etc.
    };
in
{
    home.packages = [ catppuccinGTK ];

    # Look up the exact folder name after building and adjust here if needed
    dconf.settings = {
        "org/gnome/desktop/interface" = {
            #gtk-theme = "Catppuccin-GTK-Dark"; # match actual folder name
            accent-color = "purple";
            color-scheme = "prefer-dark";

            enable-animations = true;
            enable-hot-corners = false;
            toolkit-accessibility = false;

            #icon-theme  = "Papirus";
            #cursor-theme = "Adwaita";
        };
    };
}
