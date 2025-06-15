{ config, pkgs, ... }:

{
    programs.git.enable = true;

    systemd.services.autoupdate-lexi = {
        description = "Pull config from remote and rebuild on system start";
        enable = true;

        after = [ "network-online.target" ];
        wants = [ "network-online.target" ];
        wantedBy = [ "multi-user.target" ];

        path = [ pkgs.git pkgs.bash pkgs.nixos-rebuild ];

        script = builtins.readFile ../scripts/update-system.sh;

        environment = {
            NIXOS_CONFIG_DIR = "/etc/nixos/nixos-configs";
            NIXOS_CONFIG_REMOTE_BRANCH = "lexi";
            NIXOS_CONFIG_CHANNEL = "https://nixos.org/channels/nixos-25.05";
        };

        serviceConfig = {
            Type = "oneshot";
            RemainAfterExit = true;
            StandardOutput  = "journal";
            StandardError   = "journal";
        };
    };
}