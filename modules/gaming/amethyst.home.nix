{ pkgs, ... }:

{
    home.packages = with pkgs; [
        amethyst-mod-manager
    ];
}
