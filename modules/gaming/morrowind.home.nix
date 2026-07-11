{ pkgs, ... }:

{
    home.packages = with pkgs; [
        openmw # open source Morrowind engine
        # portmod # mod manager for OpenMW
    ];
}
