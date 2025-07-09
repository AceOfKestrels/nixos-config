{ config, pkgs, ... }:

{
    virtualisation.docker.enable = true;
    virtualisation.podman.enable = true;

    environment.systemPackages = with pkgs; [
        docker-compose
    ];
}
