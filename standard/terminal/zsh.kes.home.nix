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
    '';
}
