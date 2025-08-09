{ ... }:

let
    p10k-prompt = builtins.readFile ../../scripts/p10k.zsh;
in
{
    programs.zsh.promptInit = ''
        chpwd() {
            emulate -L zsh
            ls -A --group-directories-first
        }

        ${p10k-prompt}
    '';
}
