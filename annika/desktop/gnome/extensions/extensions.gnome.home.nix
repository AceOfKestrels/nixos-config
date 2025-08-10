{ ... }:

{
    dconf.settings = {
        "org/gnome/shell" = {

            disable-user-extensions = false;

            disabled-extensions = [
                "apps-menu@gnome-shell-extensions.gcampax.github.com"
                "auto-move-windows@gnome-shell-extensions.gcampax.github.com"
                "native-window-placement@gnome-shell-extensions.gcampax.github.com"
                "drive-menu@gnome-shell-extensions.gcampax.github.com"
                "screenshot-window-sizer@gnome-shell-extensions.gcampax.github.com"

            ];

            enabled-extensions = [
                "dash-to-dock@micxgx.gmail.com"
                "system-monitor@gnome-shell-extensions.gcampax.github.com"
                "status-icons@gnome-shell-extensions.gcampax.github.com"
                "trayIconsReloaded@selfmade.pl"
                "transparent-window-moving@noobsai.github.com"
            ];
        };
    };
}
