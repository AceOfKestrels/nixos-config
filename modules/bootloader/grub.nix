{ lib, ... }:
{
    boot.loader.systemd-boot.enable = lib.mkForce false;
    boot.loader.grub = {
        enable = true;
        efiSupport = true;
        device = "nodev";
    };
}
