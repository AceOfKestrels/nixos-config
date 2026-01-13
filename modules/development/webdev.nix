{ pkgs, ... }:

{
    environment.systemPackages = with pkgs; [
        jetbrains.webstorm

        yaak

        nodejs
        typescript
        nodemon
        npm-check-updates

        # Browser version is quicker and more stable
        # figma-linux
    ];
}
