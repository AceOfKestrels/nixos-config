{ ... }:

{
    imports = [
        ./kes/gnome/apps.home.nix
        ./kes/gnome/extensions.home.nix
        ./kes/gnome/keybindings.home.nix
        ./kes/gnome/theme.home.nix
    ];

    dconf.settings = {
        "org/gnome/shell" = {
            last-selected-power-profile = "performance";
        };

        "org/gnome/settings-daemon/plugins/color" = {
            night-light-schedule-automatic = false;
        };

        "org/gnome/desktop/peripherals/touchpad" = {
            two-finger-scrolling-enabled = true;
        };

        "org/gnome/desktop/search-providers" = {
            disable-external = false;
            disabled = [
                "org.gnome.Characters.desktop"
                "org.gnome.clocks.desktop"
                "org.gnome.seahorse.Application.desktop"
                "org.gnome.Terminal.desktop"
            ];
            sort-order = [
                "org.gnome.Settings.desktop"
                "org.gnome.Contacts.desktop"
                "org.gnome.Nautilus.desktop"
            ];
        };

        "org/gnome/mutter" = {
            attach-modal-dialogs = false;
            dynamic-workspaces = true;
            workspaces-only-on-primary = false;
        };

        "org/gnome/desktop/a11y/applications" = {
            screen-magnifier-enabled = false;
            screen-reader-enabled = false;
        };
    };
}
