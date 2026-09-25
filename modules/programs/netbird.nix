{ pkgs, ... }:

{
    environment.systemPackages = with pkgs; [
        netbird-ui
        netbird
    ];
}
