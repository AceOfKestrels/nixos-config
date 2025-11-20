{ pkgs, kestrel, ... }:

{
    environment.systemPackages = with pkgs; [
        orca-slicer
        freecad
    ];
}
