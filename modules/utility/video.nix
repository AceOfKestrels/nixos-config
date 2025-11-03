{ pkgs, ... }:

{
    boot.kernelModules = [ "sg" ];

    environment.systemPackages = with pkgs; [
        handbrake
        makemkv
        mkvtoolnix
        mediainfo-gui
        mediainfo
        vlc
        asunder
    ];
}
