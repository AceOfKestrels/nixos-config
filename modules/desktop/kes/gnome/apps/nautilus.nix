{ kestrel, hm, ... }:

kestrel.mkHome {
    dconf.settings = {
        "org/gnome/nautilus/list-view" = {
            default-column-order = [
                "name"
                "size"
                "type"
                "owner"
                "group"
                "permissions"
                "date_modified"
                "date_accessed"
                "date_created"
                "recency"
                "detailed_type"
            ];
            default-visible-columns = [
                "name"
                "size"
                "date_modified"
            ];
        };

        "org/gnome/nautilus/preferences" = {
            default-folder-viewer = "list-view";
            migrated-gtk-settings = true;
            search-filter-time-type = "last_modified";
        };

        "org/gnome/nautilus/window-state" = {
            initial-size = hm.gvariant.mkTuple [
                890
                638
            ];
            initial-size-file-chooser = hm.gvariant.mkTuple [
                890
                550
            ];
            maximized = false;
        };
    };
}
