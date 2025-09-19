{ kestrel, pkgs, ... }:
{

    # Gnome Extensions
    environment.systemPackages = with pkgs.gnomeExtensions; [
        dash-to-dock
        transparent-window-moving
        tray-icons-reloaded
        system-monitor
    ];
}
// kestrel.mkHome {
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

        "org/gnome/shell/extensions/dash-to-dock" = {
            background-opacity = 0.8;
            dash-max-icon-size = 32;
            dock-position = "BOTTOM";
            height-fraction = 0.9;
            multi-monitor = true;
            preferred-monitor = -2;
            preferred-monitor-by-connector = "DP-0";
            preview-size-scale = 0.0;
            show-mounts = false;
        };

        "org/gnome/shell/extensions/trayIconsReloaded" = {
            icon-size = 16;
            icons-limit = 8;
        };

        "org/gnome/tweaks" = {
            show-extensions-notice = false;
        };
    };
}
