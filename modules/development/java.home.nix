{ pkgs, ... }:

{
    home.packages = with pkgs; [
        jetbrains.idea
    ];

    imports = [ ../libraries/java.home.nix ];
}
