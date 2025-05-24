    { config, pkgs, ... }:

    let
    mesa24pkgs = import (builtins.fetchTarball {
        url = "https://github.com/NixOS/nixpkgs/archive/nixos-24.11.tar.gz";
        # you can pin the sha256 if you like, but Nix will tell you what it needs
    }) { system = pkgs.system; };

    in {
    nixpkgs.overlays = [
        (self: super: {
        # Override the mesa package and related libs with the old ones
        mesa        = mesa24pkgs.mesa;
        libdrm      = mesa24pkgs.libdrm;
        llvmPackages = mesa24pkgs.llvmPackages;  # so shader compiler matches
        # if you want to be extra thorough:
        libva       = mesa24pkgs.libva;
        libvdpau    = mesa24pkgs.libvdpau;
        })
    ];

    # (the rest of your config…)
}
