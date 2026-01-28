{ pkgs, ... }:

{
    environment.systemPackages = with pkgs; [
        lutris

        vulkan-tools
        protontricks
        protonup-qt
        gamescope
        wine
        wine64
    ];
}
