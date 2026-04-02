{ ... }:

let
    p10k-prompt = builtins.readFile ./p10k.annika.zsh;
in
{
    programs.zsh.initContent = ''
        ${p10k-prompt}
    '';

    programs.zsh.shellAliases = {
        ls = "ls -alh";
    };
}
