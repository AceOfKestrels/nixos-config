{ lib, pkgs, ... }:
{
    boot.loader.systemd-boot.enable = lib.mkForce false; # replaced by lanzaboote
    boot.loader.grub.enable = lib.mkForce false; # ensure it’s off
    boot.loader.efi.canTouchEfiVariables = true;

    boot.lanzaboote.enable = true;
    # Point to where sbctl created your keys:
    boot.lanzaboote.pkiBundle = "/etc/secureboot";

    # (Optional but common if you want TPM2 unlock later)
    boot.initrd.systemd.enable = true;

    environment.systemPackages = with pkgs; [
        sbctl
    ];
}
