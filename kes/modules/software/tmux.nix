{ pkgs, ... }:

let
    script = builtins.readFile ../../scripts/tmux-attach-to-latest.sh;
in
{
    imports = [ ../../../modules/home-manager.nix ];
    home-manager.sharedModules = [ ./tmux.home.nix ];

    environment.systemPackages = [
        (pkgs.writeShellScriptBin "tmux-attach-to-latest" script)
    ];

    environment.interactiveShellInit = ''
        if [[ $TERM = screen-256color ]]; then
            alias exit="tmux detach || builtin exit"
        fi
    '';

    systemd.user.services.tmux-resurrect-save-on-exit = {
        description = "Run tmux-resurrect save when the user session stops";
        wantedBy = [ "default.target" ];

        path = [
            pkgs.tmux
            pkgs.bash
        ];

        script = ''
            tmux has-session 2>/dev/null || tmux new-session -d -s autostart
        '';
        preStop = ''
            if tmux has-session 2>/dev/null; then
                if ! tmux run-shell "${pkgs.tmuxPlugins.resurrect}/share/tmux-plugins/resurrect/scripts/save.sh"; then
                    echo "failed to save tmux sessions"
                fi
            else
                echo "no active tmux session"
            fi
        '';

        serviceConfig = {
            Type = "oneshot";
            RemainAfterExit = true;
            TimeoutStopSec = "10s";
            StandardOutput = "journal";
            StandardError = "journal";
        };
    };
}
