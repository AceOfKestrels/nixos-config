{ pkgs, ... }:

{
    home.packages = with pkgs; [
        prismlauncher
    ];

    imports = [ ../libraries/java.home.nix ];
}
