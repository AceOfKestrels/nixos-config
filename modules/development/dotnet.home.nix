{ pkgs, ... }:

{
    home.packages = with pkgs; [
        stable.jetbrains.rider

        yaak
    ];

    imports = [ ../libraries/dotnet.home.nix ];
}
