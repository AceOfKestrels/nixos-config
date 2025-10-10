{ kestrel, ... }:

kestrel.mkHome {
    dconf.settings = {
        "org/gnome/desktop/wm/keybindings" = {
            activate-window-menu = [ ];
            switch-to-workspace-left = [ "<Control><Super>Left" ];
            switch-to-workspace-right = [ "<Control><Super>Right" ];
        };

        "org/gnome/settings-daemon/plugins/media-keys" = {
            custom-keybindings = [
                "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/"
                "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1/"
            ];
            magnifier-zoom-in = [ "<Super>plus" ];
            magnifier-zoom-out = [ "<Super>minus" ];
        };

        "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0" = {
            binding = "<Control><Alt>t";
            command = "kitty";
            name = "Terminal";
        };

        "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1" = {
            binding = "<Super>e";
            command = "nautilus -w";
            name = "Nautilus";
        };

        "org/gnome/shell/keybindings" = {
            show-screenshot-ui = [ "<Shift><Super>s" ];
        };
    };
}
