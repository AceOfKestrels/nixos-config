{ lib, ... }:

{
    programs.nh.enable = true;
    programs.nh.clean = {
        clean.enable = true;
        clean.extraArgs = "--keep 5 --keep-since 30d";
        clean.dates = "weekly";
    };

    nix.gc.automatic = lib.mkForce false;
}
