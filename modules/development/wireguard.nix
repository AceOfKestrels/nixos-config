{
    config,
    pkgs,
    lib,
    ...
}:

let
    shortcuts-script = {
        text = builtins.readFile ../../scripts/shell/wireguard-shortcuts.sh;
        mode = "0755";
    };
in
{
    environment.systemPackages = [ pkgs.wireguard-tools ];

    environment = {
        etc."profile.d/wireguard-shortcuts.sh" = shortcuts-script;

        shellInit = ''
            . /etc/profile.d/wireguard-shortcuts.sh
        '';

        variables.WIREGUARD_CONFS_DIR = "$HOME/Nextcloud/Secrets/Wireguard";
    };
}
