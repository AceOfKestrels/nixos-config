{ pkgs, ... }:

let
    script = builtins.readFile ../../scripts/tmux-attach-to-latest.sh;
    terminal = "screen-256color";
in
{
    programs.tmux = {
        enable = true;
        historyLimit = 10000;
        terminal = terminal;
        extraConfig = ''
            set -g mouse on
            set -g exit-empty off

            bind -n C-Left select-pane -L
            bind -n C-Right select-pane -R
            bind -n C-Up select-pane -U
            bind -n C-Down select-pane -D

            set-option -g status off

            set -ag terminal-overrides ",*:Tc"
        '';
    };

    environment.systemPackages = [
        (pkgs.writeShellScriptBin "tmux-attach-to-latest" script)
    ];

    environment.interactiveShellInit = ''
        if [[ $TERM = ${terminal} ]]; then
            alias exit="tmux detach || builtin exit"
        fi
    '';
}
