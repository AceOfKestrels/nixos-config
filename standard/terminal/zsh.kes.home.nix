{ ... }:

let
    p10k-prompt = builtins.readFile ./p10k.kes.zsh;
in
{
    programs.zsh.initContent = ''
        cd() {
            builtin cd "$@" || return
            ls -A --group-directories-first
        }

        ${p10k-prompt}
    '';
}
