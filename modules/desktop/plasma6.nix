{
    kestrel,
    config,
    pkgs,
    ...
}:

{
    # Enable SDDM
    services.displayManager.sddm.enable = true;

    # Enable KDE Plasma 6
    services.desktopManager.plasma6.enable = true;

    hardware.bluetooth.enable = true;

    environment.plasma6.excludePackages = with pkgs.kdePackages; [
        plasma-browser-integration
    ];

    imports = kestrel.userModules config {
        kes = ./plasma6.kes.nix;
    };
}
