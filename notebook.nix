{ config, pkgs, ... }:

{
    imports = [
        ./modules/core.nix
        ./modules/development/docker.nix
        ./modules/development/dotnet.nix
        ./modules/development/php.nix
        #./modules/development/python.nix
    ];

    environment.systemPackages = with pkgs; [];
}