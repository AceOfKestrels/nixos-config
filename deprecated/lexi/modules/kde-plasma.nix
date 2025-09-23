{ pkgs, ... }:

{

    # Enable KDE Plasma 6
    services.displayManager.sddm.enable = true;
    services.desktopManager.plasma6.enable = true;

    hardware.bluetooth.enable = true;

    environment.plasma6.excludePackages = with pkgs.kdePackages; [
        plasma-browser-integration
    ];
}
