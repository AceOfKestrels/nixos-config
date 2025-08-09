{ ... }:

let
    p10k-prompt = builtins.readFile ./p10k.zsh;
in
{
    programs.zsh.promptInit = ''
        ${p10k-prompt}
    '';
}
