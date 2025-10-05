{ pkgs, kestrel, ... }:

{
    imports = [ ./tmux.nix ];
    environment.systemPackages = with pkgs; [
        kitty
    ];
}
// kestrel.mkHome {
    programs.kitty = {
        enable = true;

        extraConfig = builtins.readFile ./kitty.conf;
    };
}
