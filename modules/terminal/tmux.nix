{ pkgs, ... }:

let
    script = builtins.readFile ./tmux-attach-to-latest.sh;
    terminal = "screen-256color";
in
{
    programs.tmux = {
        enable = true;
        historyLimit = 10000;
        terminal = terminal;
        extraConfig = builtins.readFile ./tmux.conf;
    };

    environment.systemPackages = [
        (pkgs.writeShellScriptBin "tmux-attach-to-latest" script)
    ];

    environment.interactiveShellInit = ''
        if [[ $TERM = ${terminal} ]]; then
            alias exit="tmux detach || builtin exit"
        fi
    '';
}
