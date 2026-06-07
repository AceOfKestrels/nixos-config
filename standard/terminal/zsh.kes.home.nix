{ lib, ... }:

let
    p10k-prompt = builtins.readFile ./p10k.kes.zsh;
in
{
    programs.zsh.enable = true;
    programs.zsh.initContent = lib.mkOrder 1000 ''
        # The following lines were added by compinstall

        zstyle ':completion:*' completer _expand _complete _ignored _approximate
        zstyle ':completion:*' verbose false
        zstyle :compinstall filename '/home/kes/.zshrc'

        autoload -Uz compinit
        compinit
        # End of lines added by compinstall
        # Lines configured by zsh-newuser-install
        HISTFILE=~/.histfile
        HISTSIZE=1000
        SAVEHIST=1000
        unsetopt beep
        # End of lines configured by zsh-newuser-install

        cd() {
            builtin cd "$@" || return
            ls -A --group-directories-first
        }

        ${p10k-prompt}

        # rainbow fetch
        fastfetch --logo-color-1 #f38ba8 --logo-color-2 #fab387 --logo-color-3 #f9e2af --logo-color-4 #a6e3a1 --logo-color-5 #89b4fa --logo-color-6 #cba6f7

        # upgrade reminder
        if [ -z "$(git -C "$FLAKE_PATH" log --since=$(date -d "-1day" +%s) "$FLAKE_PATH/flake.lock" )" ]; then
            echo
            echo "System was last upgraded $(git -C "$FLAKE_PATH" log --pretty=format:%ad --date=relative -n 1 $FLAKE_PATH/flake.lock)"
            echo "Use 'upgrade' to run the NixOS system upgrade."
        fi
    '';
}
