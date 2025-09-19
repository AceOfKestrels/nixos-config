{ kestrel, ... }:

kestrel.mkHome {
    dconf.settings = {
        "org/gnome/gnome-system-monitor" = {
            current-tab = "resources";
            maximized = false;
            show-dependencies = false;
            show-whose-processes = "user";
            window-height = 720;
            window-width = 800;
        };

        "org/gnome/gnome-system-monitor/disksview" = {
            sort-col = "directory";
            sort-order = 1;
        };
    };
}
