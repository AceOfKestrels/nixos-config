{ lib, config, pkgs, ... }:

{
    boot.kernelPackages = pkgs.linuxPackages_zen;

    networking.hostName = "nixos";

    users.users.kes = {
        isNormalUser = true;
        description = "Kessandra";
        extraGroups = [ "networkmanager" "wheel" ];
    };
    
    imports = [
        ../modules/kes-core.nix
    ];

    environment.systemPackages = with pkgs; [
    ];
    
    environment.variables.NIXOS_CONFIG_PATH = lib.mkForce "$HOME/nixos-config";
}