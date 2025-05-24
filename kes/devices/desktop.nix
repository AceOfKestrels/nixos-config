{ config, pkgs, ... }:

{
    boot.kernelPackages = pkgs.linuxPackages_zen;

    imports = [
        ../modules/kes-core.nix
        
        ../modules/amdgpu.nix
        ../modules/downgrade-mesa.nix

        ../../modules/gaming/minecraft.nix
        ../../modules/gaming/steam.nix
    ];

    environment.systemPackages = with pkgs; [
        ytmdesktop
        discord
    ];
}