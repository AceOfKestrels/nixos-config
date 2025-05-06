{ config, pkgs, ... }:

{
    # Enable GDM
    services.xserver.displayManager.gdm.enable = true;

    # Enable KDE Plasma 6
    services.desktopManager.plasma6.enable = true;

    hardware.bluetooth.enable = true;

    programs.kwallet.enable = true;

    environment.systemPackages = with pkgs; [
        kwallet
    ];

    environment.plasma6.excludePackages = with pkgs.kdePackages; [
        plasma-browser-integration
    ];
}