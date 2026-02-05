{
    kestrel,
    inputs,
    pkgs,
    ...
}:

{
    # Enable SDDM
    services.displayManager.sddm.enable = true;

    # Enable KDE Plasma 6
    services.desktopManager.plasma6.enable = true;

    services.gnome.gnome-keyring.enable = true;
    security.pam.services.login.enableGnomeKeyring = true;

    hardware.bluetooth.enable = true;

    environment.plasma6.excludePackages = with pkgs.kdePackages; [
        plasma-browser-integration
    ];

    imports = kestrel.userModules {
        kes = ./plasma6.kes.nix;
    };

    home-manager.sharedModules = [ inputs.plasma-manager.homeModules.plasma-manager ];
}
