{ pkgs, ... }:

{

    home.packages = with pkgs; [
        pkgsStable.teamspeak6-client
    ];
}
