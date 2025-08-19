{ ... }:
{
    programs.tmux = {
        enable = true;
        historyLimit = 10000;
        terminal = "screen-256color";
        extraConfig = ''
            set -g mouse on

            bind -n C-Left select-pane -L
            bind -n C-Right select-pane -R
            bind -n C-Up select-pane -U
            bind -n C-Down select-pane -D

            set-option -g status off

            set -ag terminal-overrides ",*:Tc"
        '';
    };

    environment.interactiveShellInit = ''
        if [ -n "$TMUX" ]; then
            alias exit="tmux detach"
        fi
    '';
}
