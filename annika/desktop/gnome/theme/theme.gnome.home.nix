{ pkgs, ... }:
let
    # pick your flavor + accent
    cursorPkg = pkgs.catppuccin-cursors.macchiatoDark;
in
{
    home.packages = [ cursorPkg ];

    home.pointerCursor = {
        package = pkgs.catppuccin-cursors.macchiatoDark;
        name = "catppuccin-macchiato-dark-cursors";
        size = 24;
        gtk.enable = true;
        x11.enable = true;
    };

    # Look up the exact folder name after building and adjust here if needed
    dconf.settings = {
        "org/gnome/desktop/interface" = {
            gtk-theme = "Adwaita";
            accent-color = "purple";
            color-scheme = "prefer-dark";

            cursor-theme = "catppuccin-macchiato-dark-cursors";

            enable-animations = true;
            enable-hot-corners = false;
            toolkit-accessibility = false;

            #icon-theme  = "Papirus";

        };
        "org/gnome/desktop/wm/preferences" = {
            button-layout = "appmenu:minimize,maximize,close";
        };
    };
}
