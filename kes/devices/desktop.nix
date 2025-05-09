{ config, pkgs, ... }:

{
    imports = [
        ../modules/kes-core.nix
        
        ../modules/amdgpu.nix

        ../../modules/gaming/minecraft.nix
        ../../modules/gaming/steam.nix
    ];

    environment.systemPackages = with pkgs; [
        ytmdesktop
        discord
    ];
}