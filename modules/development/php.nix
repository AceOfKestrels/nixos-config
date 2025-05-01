{ config, pkgs, ... }:

{
    environment.systemPackages = with pkgs; [
        jetbrains.phpstorm

        php
    ];
}