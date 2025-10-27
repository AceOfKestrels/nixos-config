{ pkgs, ... }:

{
    environment.systemPackages = with pkgs; [
        jetbrains.webstorm

        yaak

        nodejs

        # Browser version is quicker and more stable
        # figma-linux
    ];
}
