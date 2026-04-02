{ pkgs, ... }:

{
    home.packages = with pkgs; [
        jdk17
        jdk8
    ];
}
