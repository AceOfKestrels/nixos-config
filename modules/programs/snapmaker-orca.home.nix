{ pkgs, ... }:

{
    home.packages = with pkgs; [
        snapmaker-orca
    ];
}
