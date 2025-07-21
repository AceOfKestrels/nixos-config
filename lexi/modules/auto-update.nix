{ pkgs, ... }:

let
    pull-service = "lexi-pull-config";
    rebuild-service = "lexi-rebuild";

    config-channel = "https://nixos.org/channels/nixos-25.05";
    remote-branch = "lexi";
    config-directory = "/etc/nixos/nixos-configs";
    system-config = "/etc/nixos/configuration.nix";
    rebuild-action = "switch";
    startup-delay = "1min";
in
{
    programs.git.enable = true;

    environment.shellAliases = {
        update = "systemctl --user start --no-block ${pull-service}; sudo systemctl start --no-block ${rebuild-service}";
        update-cancel = "systemctl --user stop ${pull-service}; sudo systemctl stop ${rebuild-service}";
        update-status = "systemctl --user status ${pull-service}; echo; sudo systemctl status ${rebuild-service}";
        update-log = "journalctl -b --user-unit ${pull-service} --unit ${rebuild-service}";
        update-follow = "journalctl -b -f --no-tail --user-unit ${pull-service} --unit ${rebuild-service}";
    };

    systemd.user.services.${pull-service} = {
        description = "Pull config from remote";

        path = [
            pkgs.git
            pkgs.bash
        ];

        script = builtins.readFile ../scripts/pull-config.sh;

        environment = {
            NIXOS_CONFIG_DIR = config-directory;
            NIXOS_CONFIG_REMOTE_BRANCH = remote-branch;
        };

        serviceConfig = {
            Type = "oneshot";
            RemainAfterExit = false;
            StandardOutput = "journal";
            StandardError = "journal";
        };
    };

    systemd.user.timers.${pull-service} = {
        description = "Pull configs on boot";
        enable = true;
        wantedBy = [ "timers.target" ];

        timerConfig = {
            OnBootSec = startup-delay;
            Unit = "${pull-service}.service";
        };
    };

    systemd.services.${rebuild-service} = {
        description = "Rebuild system";

        path = [
            pkgs.bash
            pkgs.git
            pkgs.nixos-rebuild
            pkgs.nix
        ];

        script = builtins.readFile ../scripts/update-system.sh;

        environment = {
            NIXOS_CONFIG_CHANNEL = config-channel;
            NIXOS_SYSTEM_CONFIG = system-config;
            NIXOS_REBUILD_ACTION = rebuild-action;
        };

        serviceConfig = {
            Type = "oneshot";
            RemainAfterExit = false;
            StandardOutput = "journal";
            StandardError = "journal";
        };
    };

    systemd.timers.${rebuild-service} = {
        description = "Rebuild on boot";
        enable = true;
        wantedBy = [ "timers.target" ];

        timerConfig = {
            OnBootSec = startup-delay;
            Unit = "${rebuild-service}.service";
        };
    };
}
