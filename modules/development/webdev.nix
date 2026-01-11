{ pkgs, ... }:

{
    environment.systemPackages = with pkgs; [
        jetbrains.webstorm

        yaak

        nodejs
        typescript
        nodemon

        # Browser version is quicker and more stable
        # figma-linux
    ];
}
