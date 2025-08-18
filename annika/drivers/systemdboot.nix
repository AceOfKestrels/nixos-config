{ lib, ... }:
{
    boot.loader.systemd-boot.enable = lib.mkForce true;

    # Menu behavior
    boot.loader.timeout = 5; # seconds
    boot.loader.systemd-boot.editor = false;
    boot.loader.systemd-boot.consoleMode = "max"; # or "keep" | "0".."5"

    # Extra entries appear in /boot/loader/entries/*.conf
    boot.loader.systemd-boot.extraEntries = {
        "windows.conf" = ''
            title   Windows Fuckery
            sort-key 20-windows
            efi     /EFI/Microsoft/Boot/bootmgfw.efi
        '';
    };
}
