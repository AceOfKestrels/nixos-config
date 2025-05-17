{ config, pkgs, lib, ... }:

{
    environment.variables = {
        WIREGUARD_CONFS_DIR = "$HOME/Nextcloud/Secrets/Wireguard";
    };
}
