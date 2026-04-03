{ pkgs, ... }:

{
    home.packages = with pkgs; [
        jetbrains.rider

        yaak
    ];

    imports = [ ../libraries/dotnet.home.nix ];
}
