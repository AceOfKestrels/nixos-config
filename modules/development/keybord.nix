{ pkgs, ... }:

{
    imports = [
        ./c++.nix
    ];

    environment.systemPackages = with pkgs; [
        kicad
        freecad
    ];

}
