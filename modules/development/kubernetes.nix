{ config, pkgs, ... }:

{
    imports = [ 
        ../../overlays/freelens.overlay.nix 
        ./terraform.nix
    ];

    environment.systemPackages = with pkgs; [
        packer
        kubectl
        coreutils
    ];
}
