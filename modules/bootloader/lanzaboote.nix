{
    lib,
    pkgs,
    inputs,
    ...
}:
{
    imports = [ inputs.lanzaboote.nixosModules.lanzaboote ];

    boot.loader.systemd-boot.enable = lib.mkForce false; # replaced by lanzaboote
    boot.loader.grub.enable = lib.mkForce false; # ensure it’s off
    boot.loader.efi.canTouchEfiVariables = true;

    boot.lanzaboote.enable = true;
    # Point to where sbctl created your keys:
    boot.lanzaboote.pkiBundle = "/etc/secureboot";

    # (Optional but common if you want TPM2 unlock later)
    boot.initrd.systemd.enable = true;

    # Menu behavior
    boot.loader.timeout = 5; # seconds
    boot.loader.systemd-boot.editor = false;
    boot.loader.systemd-boot.consoleMode = "max"; # or "keep" | "0".."5"

    environment.systemPackages = with pkgs; [
        sbctl
    ];
}
