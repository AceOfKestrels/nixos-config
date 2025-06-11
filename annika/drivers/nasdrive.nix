{ config, pkgs, ... }:
{
  boot.supportedFilesystems = [ "nfs" ];
  services.rpcbind.enable = true;

  systemd.mounts = [
    {
      what        = "10.100.20.10:/mnt/bunker.nas.local.wa-ls.net/home-storage";
      where       = "/home/annika/disks/nas-personal";
      type        = "nfs";
      mountConfig = {
        Options = "rw,hard,intr,proto=tcp,_netdev";
      };
    }
    {
      what        = "10.100.20.10:/mnt/bunker.nas.local.wa-ls.net/games";
      where       = "/home/annika/disks/nas-games";
      type        = "nfs";
      mountConfig = {
        Options = "rw,hard,intr,proto=tcp,_netdev";
      };
    }
  ];

  systemd.automounts = [
    {
      where           = "/home/annika/disks/nas-personal";
      wantedBy        = [ "multi-user.target" ];
      automountConfig = { TimeoutIdleSec = "10min"; };
    }
    {
      where           = "/home/annika/disks/nas-games";
      wantedBy        = [ "multi-user.target" ];
      automountConfig = { TimeoutIdleSec = "10min"; };
    }
  ];

  environment.systemPackages = with pkgs; [ nfs-utils ];
}
