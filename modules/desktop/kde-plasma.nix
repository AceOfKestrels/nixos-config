{ config, pkgs, ... }:

{
    # Enable GDM
    services.xserver.displayManager.gdm.enable = true;

    # Enable KDE Plasma 6
    services.desktopManager.plasma6.enable = true;

    hardware.bluetooth.enable = true;

    # programs.ssh.askPassword = lib.mkDefault pkgs.plasma-workspace.ksshaskpass.packageContents.bin.ksshaskpass;

    environment.systemPackages = with pkgs; [
        gnome-terminal
    ];

    environment.plasma6.excludePackages = with pkgs.kdePackages; [
        plasma-browser-integration
        konsole
    ];
}