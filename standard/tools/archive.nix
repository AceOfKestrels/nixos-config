{ pkgs, ... }:

{
    environment.systemPackages = with pkgs; [
        rar
        unrar

        zip
        unzip
    ];
}
