{ pkgs, ... }:

{
    environment.systemPackages = with pkgs; [
        jellyfin-desktop
    ];
}
