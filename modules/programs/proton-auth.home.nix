{ pkgs, ... }:

{
    home.packages = with pkgs; [
        proton-authenticator
    ];
}
