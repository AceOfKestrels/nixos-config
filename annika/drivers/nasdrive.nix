{ pkgs, ... }:

{
    # Enable support for NFS filesystems at boot
    boot.supportedFilesystems = [ "nfs" ];

    # RPC binder for NFS locking
    services.rpcbind.enable = true;

    # Ensure NFS utilities are installed
    environment.systemPackages = with pkgs; [ nfs-utils ];

    # Define NFS mounts
    systemd.mounts = [
        # Personal NAS share
        {
            what = "10.100.20.10:/mnt/bunker.nas.local.wa-ls.net/home-storage";
            where = "/home/annika/disks/nas-personal";
            type = "nfs4";
            options = builtins.concatStringsSep "," [
                "rw"
                "hard"
                "intr"
                "proto=tcp"
                "_netdev"
                "exec"
                "nolock"
                "noatime"
                "rsize=1048576"
                "wsize=1048576"
            ];
        }

        # Games NAS share
        {
            what = "10.100.20.10:/mnt/bunker.nas.local.wa-ls.net/games";
            where = "/home/annika/disks/nas-games";
            type = "nfs4";
            options = builtins.concatStringsSep "," [
                "rw"
                "hard"
                "intr"
                "proto=tcp"
                "_netdev"
                "exec"
                "nolock"
                "noatime"
                "rsize=1048576"
                "wsize=1048576"
            ];
        }

        # Media NAS share
        {
            what = "10.100.20.11:/volume1/media";
            where = "/home/annika/disks/media";
            type = "nfs4";
            options = builtins.concatStringsSep "," [
                "rw"
                "hard"
                "intr"
                "proto=tcp"
                "_netdev"
                "exec"
                "nolock"
                "noatime"
                "rsize=1048576"
                "wsize=1048576"
            ];
        }
    ];

    # Automount units to unmount after idle
    systemd.automounts = [
        {
            where = "/home/annika/disks/nas-personal";
            wantedBy = [ "multi-user.target" ];
        }

        {
            where = "/home/annika/disks/nas-games";
            wantedBy = [ "multi-user.target" ];
        }
    ];
}
