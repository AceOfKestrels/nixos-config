{ pkgs, ... }:

{
    home.packages = with pkgs; [
        convergence-mod-launcher
    ];
}
