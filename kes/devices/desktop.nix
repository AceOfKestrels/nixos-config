{ config, pkgs, ... }:

{
    boot.kernelPackages = pkgs.linuxPackages_zen;

    security.sudo.wheelNeedsPassword = false;
    
    imports = [
        ../modules/kes-core.nix
        
        ../modules/amdgpu.nix

        ../../modules/gaming/minecraft.nix
        ../../modules/gaming/steam.nix

        ../../modules/development/kubernetes.nix
    ];

    environment.systemPackages = with pkgs; [
        ytmdesktop
        discord
    ];
}