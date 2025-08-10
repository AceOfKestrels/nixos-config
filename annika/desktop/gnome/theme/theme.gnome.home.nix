{ ... }:
{
    programs.dconf.enable = true;

    dconf.settings = {
        "org/gnome/desktop/interface" = {
            gtk-theme = "Adwaita-dark";
            icon-theme = "Papirus";
            cursor-theme = "Adwaita";
        };
    };
}
