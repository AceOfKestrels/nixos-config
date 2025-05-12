{ config, pkgs, ... }:

{
    programs.zsh.shellAliases = {
        ls = "ls -alh";
        edit-conf = "code /etc/nixos/nixos-config";
    };
}
