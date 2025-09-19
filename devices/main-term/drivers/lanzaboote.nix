{ ... }:
{
    imports = [ ../../../modules/bootloader/lanzaboote.nix ];

    # Extra entries appear in /boot/loader/entries/*.conf
    boot.loader.systemd-boot.extraEntries = {
        "windows.conf" = ''
            title   Windows Fuckery
            sort-key 20-windows
            efi     /EFI/Microsoft/Boot/bootmgfw.efi
        '';
    };
}
