{ config, pkgs, ... }:

{
    systemd.services.autoupdate-lexi = {
        description = "Pull config from remote and rebuild on system start";
        enable = true;

        after = [ "network-online.target" ];
        wants = [ "network-online.target" ];
        wantedBy = [ "multi-user.target" ];

        environment = {
            NIXOS_CONFIG_DIR = "/etc/nixos/nixos-configs";
            NIXOS_CONFIG_REMOTE_BRANCH = "lexi";
            NIXOS_CONFIG_CHANNEL = "https://nixos.org/channels/nixos-25.05";
        };

        serviceConfig = {
            Type = "oneshot";
            RemainAfterExit = true;
            ExecStart = "/bin/sh -c '${builtins.readFile ../scripts/update-system.sh}'";

            StandardOutput  = "journal";
            StandardError   = "journal";
        };
    };
}