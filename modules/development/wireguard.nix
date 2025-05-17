{ config, pkgs, lib, ... }:

let
    shortcuts-script = {
        text = builtins.readFile ../../scripts/shell/wireguard-shortcuts.sh;
        mode = "0755";
    };
in
{
    imports = [
        ../../local/wireguard.local.nix
    ];

    environment.systemPackages = [ pkgs.wireguard-tools ];

    environment = {
        etc."profile.d/wireguard-shortcuts.sh" = shortcuts-script;

        shellInit = ''
            . /etc/profile.d/wireguard-shortcuts.sh
        '';
    };
}
