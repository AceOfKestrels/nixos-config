{ config, pkgs, ... }:

{

    environment.systemPackages = with pkgs; [ nfs-utils ];


    fileSystems."/home/annika/disks/nas" = {
        device   = "172.25.10.1:/mnt/bunker.nas.local.wa-ls.net/home-storage";
        fsType   = "nfs";
        options  = [ "rw" "hard" "intr" "proto=tcp" ];
    };


    boot.supportedFilesystems = [ "nfs" ];
}