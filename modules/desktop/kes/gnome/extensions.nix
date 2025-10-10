{ kestrel, pkgs, ... }:
{
    # Gnome Extensions
    environment.systemPackages = with pkgs.gnomeExtensions; [
        dash-to-dock
        transparent-window-moving
        tray-icons-reloaded
        system-monitor
        sound-output-device-chooser
        tactile
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
            always-center-icons = false;
            animation-time = 0.3;
            apply-custom-theme = false;
            autohide-in-fullscreen = false;
            background-opacity = 0.8;
            click-action = "cycle-windows";
            custom-theme-shrink = false;
            customize-alphas = true;
            dash-max-icon-size = 32;
            disable-overview-on-startup = true;
            dock-position = "BOTTOM";
            extend-height = false;
            height-fraction = 0.9;
            hide-delay = 0.0;
            hide-tooltip = false;
            hot-keys = true;
            icon-size-fixed = false;
            intellihide = true;
            intellihide-mode = "ALL_WINDOWS";
            isolate-locations = true;
            isolate-monitors = true;
            isolate-workspaces = true;
            max-alpha = 1.0;
            middle-click-action = "skip";
            multi-monitor = true;
            preview-size-scale = 0.0;
            require-pressure-to-show = false;
            running-indicator-style = "DEFAULT";
            scroll-action = "cycle-windows";
            shift-click-action = "minimize";
            shift-middle-click-action = "skip";
            show-delay = 0.0;
            show-mounts = false;
            show-mounts-only-mounted = false;
            show-running = true;
            show-show-apps-button = false;
            show-trash = false;
            transparency-mode = "DYNAMIC";
        };

        "org/gnome/shell/extensions/transparent-window-moving" = {
            transition-time = 0.3;
            window-opacity = 196;
        };

        "org/gnome/shell/extensions/trayIconsReloaded" = {
            icon-brightness = 0;
            icon-contrast = 0;
            icon-margin-horizontal = 4;
            icon-margin-vertical = 0;
            icon-padding-horizontal = 8;
            icon-padding-vertical = 0;
            icon-saturation = 0;
            icon-size = 16;
            icons-limit = 8;
            invoke-to-workspace = true;
            position-weight = 1;
            tray-margin-left = 0;
            tray-margin-right = 0;
            tray-position = "left";
            wine-behavior = true;
        };

        "org/gnome/tweaks" = {
            show-extensions-notice = false;
        };
    };
}
