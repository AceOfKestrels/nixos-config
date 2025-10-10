{
    pkgs,
    kestrel,
    ...
}:

let
    # pick your flavor + accent
    cursorPkg = pkgs.catppuccin-cursors.mochaDark;

    wallpaperFile = ".local/share/backgrounds/current_wallpaper.webp";
in
kestrel.mkHome (
    { config, ... }:
    {
        home.file.${wallpaperFile}.source = ../assets/wallpaper.webp;

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
                accent-color = "blue";
                color-scheme = "prefer-dark";
                cursor-blink = true;
                cursor-blink-time = 1000;
                cursor-size = 24;
                cursor-theme = "catppuccin-mocha-dark-cursors";
                enable-animations = true;
                enable-hot-corners = false;
                font-name = "Noto Sans,  10";
                gtk-theme = "Adwaita";
                icon-theme = "Adwaita";
                scaling-factor = 1;
                show-battery-percentage = true;
                text-scaling-factor = 1.0;
                toolbar-style = "text";
                toolkit-accessibility = true;
            };

            "org/gnome/desktop/wm/preferences" = {
                button-layout = "appmenu:minimize,maximize,close";
                focus-mode = "click";
                resize-with-right-button = true;
            };

            "org/gnome/desktop/background" = {
                color-shading-type = "solid";
                picture-options = "zoom";
                picture-uri = "file://${config.home.homeDirectory}/${wallpaperFile}";
                picture-uri-dark = "file://${config.home.homeDirectory}/${wallpaperFile}";
                primary-color = "#000000000000";
                secondary-color = "#000000000000";
            };

            "org/gnome/desktop/screensaver" = {
                color-shading-type = "solid";
                picture-options = "zoom";
                picture-uri = "file://${config.home.homeDirectory}/${wallpaperFile}";
                primary-color = "#000000000000";
                secondary-color = "#000000000000";
            };

            "org/gnome/desktop/sound" = {
                theme-name = "ocean";
            };
        };
    }
)
