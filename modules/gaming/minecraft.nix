{ config, pkgs, ... }:

{
    environment.systemPackages = with pkgs; [
        prismlauncher

        jdk17
        jdk8
    ];
}
