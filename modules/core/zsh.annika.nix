{ ... }:

let
    p10k-prompt = builtins.readFile ./p10k.annika.zsh;
in
{
    programs.zsh.promptInit = ''
        ${p10k-prompt}
    '';

    programs.zsh.shellAliases = {
        ls = "ls -alh";
        edit-conf = "code /etc/nixos/nixos-config";
    };
}
