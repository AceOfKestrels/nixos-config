{ ... }:

let
    p10k-prompt = builtins.readFile ../../scripts/p10k.zsh;
in
{
    programs.zsh.promptInit = ''
        cd() {
            builtin cd "$@" || return
            ls -A --group-directories-first
        }

        ${p10k-prompt}
    '';
}
