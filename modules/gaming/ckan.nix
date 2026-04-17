{ pkgs, ... }:

{
    environment.systemPackages = with pkgs; [
        ckan
    ];
}
