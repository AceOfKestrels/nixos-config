{ pkgs, ... }:

{
    home.packages = with pkgs; [
        krita
        gimp3
        inkscape
    ];
}
