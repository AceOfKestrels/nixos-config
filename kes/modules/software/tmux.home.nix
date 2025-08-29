{ pkgs, ... }:

{
    programs.tmux = {
        enable = true;
        historyLimit = 10000;
        terminal = "screen-256color";
        extraConfig = ''
            set -g mouse on
            set -g exit-empty off

            bind -n C-Left select-pane -L
            bind -n C-Right select-pane -R
            bind -n C-Up select-pane -U
            bind -n C-Down select-pane -D

            # set-option -g status off

            set -ag terminal-overrides ",*:Tc"

            # tmux-resurrect
            set -g @resurrect-save-bash-history on
            set -g @resurrect-strategy-nvim session

            # tmux-continuum
            set -g @continuum-restore on
            set-option -g status on
        '';

        plugins = with pkgs.tmuxPlugins; [
            resurrect
            continuum
        ];
    };
}
