{ pkgs, ... }:

{
    home.pkgs = with pkgs; [
        onlyoffice-desktopeditors
    ];
}
