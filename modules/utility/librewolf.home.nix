{ pkgs, ... }:

{
    home.packages = [ pkgs.librewolf ];

    programs.firefox = {
        enable = true;
        package = pkgs.librewolf;
    };
}
