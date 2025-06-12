{ config, pkgs, ... }:

{
    boot.kernelPackages = pkgs.linuxPackages_zen;
    
    imports = [
        ../modules/kes-core.nix
    ];

    environment.systemPackages = with pkgs; [
    ];
}