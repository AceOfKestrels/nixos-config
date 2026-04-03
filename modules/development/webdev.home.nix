{ pkgs, ... }:

{
    home.packages = with pkgs; [
        jetbrains.webstorm

        yaak

        nodejs
        typescript
        nodemon
        npm-check-updates
    ];
}
