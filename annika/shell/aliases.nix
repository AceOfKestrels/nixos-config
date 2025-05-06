{ config, pkgs, ... }:

{
    programs.zsh.shellAliases = {
        ls = "ls -alh";
        upgrade = "nixos-rebuild boot --upgrade";
        edit-conf = "code /etc/nixos/nixos-config";
    };
}
