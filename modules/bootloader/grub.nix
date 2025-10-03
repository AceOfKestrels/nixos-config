{ lib, ... }:
{
    boot.loader.systemd-boot.enable = lib.mkForce false;
    boot.loader.grub = {
        enable = lib.mkForce true;
        copyKernels = lib.mkForce true;
        efiSupport = true;
        device = "nodev";
        configurationLimit = 5;
    };
}
