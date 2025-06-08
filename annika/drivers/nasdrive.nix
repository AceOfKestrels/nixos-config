{ config, pkgs, ... }:

{
  # make sure the NFS kernel module is loaded
  boot.supportedFilesystems = [ "nfs" ];

  # start rpcbind so mount.nfs can do its RPCs
  services.rpcbind.enable = true;

  # your NFS share
  fileSystems."/home/annika/disks/nas" = {
    device  = "10.100.20.10:/mnt/bunker.nas.local.wa-ls.net/home-storage";
    fsType  = "nfs";
    options = [ "rw" "hard" "intr" "proto=tcp" ];
  };

  # you can still have the CLI tool handy if you ever need it
  environment.systemPackages = with pkgs; [ nfs-utils ];
}
