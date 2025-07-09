{ pkgs, ... }:

{
    programs.git.enable = true;

    environment.variables = {
        NIXOS_CONFIG_REMOTE_BRANCH = "lexi";
        NIXOS_CONFIG_CHANNEL = "https://nixos.org/channels/nixos-25.05";
    };

    programs.bash.shellInit = ''
        update() {
            cd "$NIXOS_CONFIG_PATH"
            git fetch --prune
            git reset --hard "origin/$NIXOS_CONFIG_REMOTE_BRANCH"
            sudo nix-channel --add "$NIXOS_CONFIG_CHANNEL" nixos 
            sudo nixos-rebuild switch --upgrade
            cd -
        }
    '';

    systemd.user.services.lexi-pull-config = {
        description = "Pull config from remote";

        path = [
            pkgs.git
            pkgs.bash
        ];

        script = builtins.readFile ../scripts/pull-config.sh;

        environment = {
            NIXOS_CONFIG_DIR = "/etc/nixos/nixos-configs";
            NIXOS_CONFIG_REMOTE_BRANCH = "lexi";
        };

        serviceConfig = {
            Type = "oneshot";
            RemainAfterExit = false;
            StandardOutput = "journal";
            StandardError = "journal";
        };
    };

    systemd.user.timers.lexi-pull-config = {
        description = "Pull configs on boot";
        enable = true;
        wantedBy = [ "timers.target" ];

        timerConfig = {
            OnBootSec = "2min"; # delay a bit after each reboot
            Unit = "lexi-pull-config.service"; # fires the above service
        };
    };

    systemd.services.lexi-rebuild = {
        description = "Rebuild system";

        path = [
            pkgs.bash
            pkgs.git
            pkgs.nixos-rebuild
            pkgs.nix
        ];

        script = builtins.readFile ../scripts/update-system.sh;

        environment = {
            NIXOS_CONFIG_CHANNEL = "https://nixos.org/channels/nixos-25.05";
            # NIXOS_CONFIG_CHANNEL = "https://nixos.org/channels/nixos-unstable";
            NIXOS_SYSTEM_CONFIG = "/etc/nixos/configuration.nix";
            NIXOS_REBUILD_ACTION = "switch"; # or boot
        };

        serviceConfig = {
            Type = "oneshot";
            RemainAfterExit = false;
            StandardOutput = "journal";
            StandardError = "journal";
        };
    };

    systemd.timers.lexi-rebuild = {
        description = "Rebuild on boot";
        enable = true;
        wantedBy = [ "timers.target" ];

        timerConfig = {
            OnBootSec = "3min"; # delay a bit after each reboot
            Unit = "lexi-rebuild.service"; # fires the above service
        };
    };
}
