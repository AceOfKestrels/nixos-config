{ pkgs, ... }:
let
    # pick your flavor + accent
    cursorPkg = pkgs.catppuccin-cursors.mochaDark;
in
{
    home.packages = [ cursorPkg ];

    home.pointerCursor = {
        package = cursorPkg;
        name = "catppuccin-mocha-dark-cursors";
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

            cursor-theme = "catppuccin-mocha-dark-cursors";

            enable-animations = true;
            enable-hot-corners = false;
            toolkit-accessibility = false;

            icon-theme = "Adwaita";

        };
        "org/gnome/desktop/wm/preferences" = {
            button-layout = "appmenu:minimize,maximize,close";
        };
        "org/gnome/mutter" = {
            dynamic-workspaces = true;
            workspaces-only-on-primary = true;
        };
    };
}
