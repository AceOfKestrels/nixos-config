{ pkgs, ... }:

{
    imports = [
        ./dotnet.nix
    ];

    environment.systemPackages = with pkgs; [
        kicad
        freecad
    ];

}
