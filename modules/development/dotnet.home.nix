{ pkgs, ... }:

{
    home.packages = with pkgs; [
        pkgsStable.jetbrains.rider

        yaak
    ];

    imports = [ ../libraries/dotnet.home.nix ];
}
