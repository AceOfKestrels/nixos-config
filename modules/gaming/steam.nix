{
    pkgs,
    ...
}:

{
    programs.steam = {
        enable = true;
        remotePlay.openFirewall = true;
        dedicatedServer.openFirewall = true;
        localNetworkGameTransfers.openFirewall = true;
    };

    environment.systemPackages = with pkgs; [
        vulkan-tools
        protontricks
        protonup-qt
    ];

    hardware.steam-hardware.enable = true;
}
