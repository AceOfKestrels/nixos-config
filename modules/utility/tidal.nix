{ pkgs, ... }:

{

    environment.systemPackages = with pkgs; [
        tidal-dl
        tidal-hifi
    ];
}
