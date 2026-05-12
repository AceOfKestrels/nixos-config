{ ... }:

{
    services.displayManager.gdm.enable = true;
    services.xserver.desktopManager.lxqt.enable = true;

    services.gnome.gnome-keyring.enable = true;
    security.pam.services.login.enableGnomeKeyring = true;
}
