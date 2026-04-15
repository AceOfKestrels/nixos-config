{
    kestrix,
    pkgs,
    ...
}:

{
    services.xserver.enable = true;

    services.displayManager.gdm.enable = true;
    services.desktopManager.gnome.enable = true;

    services.displayManager.defaultSession = "gnome";

    services.gnome.gnome-keyring.enable = true;
    security.pam.services.login.enableGnomeKeyring = true;

    programs.dconf.enable = true;

    environment.systemPackages = with pkgs; [
        # Gnome Packetes
        gnome-keyring
        gnome-tweaks
        # Gnome Dependencys
        ibus
        dbus
    ];

    environment.gnome.excludePackages = (
        with pkgs;
        [
            atomix
            cheese
            epiphany
            geary
            gnome-tour
            hitori
            iagno
            tali
            gnome-calendar
            gnome-maps
            gnome-weather
            gnome-contacts
        ]
    );

    imports = kestrix.tagged {
        kes = [ ./gnome.kes.home.nix ];
        annika = [ ./gnome.annika.home.nix ];
    };
}
