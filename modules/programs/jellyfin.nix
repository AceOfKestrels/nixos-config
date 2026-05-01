{ pkgs, ... }:

{
    environment.systemPackages = with pkgs; [
        jellyflix
    ];
}
