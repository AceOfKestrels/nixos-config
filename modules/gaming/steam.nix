{ config, pkgs, ... }:

{
    programs.steam = {
        enable = true;
        remotePlay.openFirewall = true;
        dedicatedServer.openFirewall = true;
        localNetworkGameTransfers.openFirewall = true;
    };    
    
    environment.systemPackages = with pkgs; [
        steam
        protontricks
        protonup-qt
    ];
}