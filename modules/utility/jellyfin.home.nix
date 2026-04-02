{ pkgs, ... }:

{
    home.packages = with pkgs; [
        jellyfin-desktop
    ];
}
