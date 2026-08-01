{ pkgs, ... }:

{
    imports = [ ./pkg.nix ];

    environment.systemPackages = [ pkgs.flatpak-poc ];

    services.flatpak.enable = true;
}
