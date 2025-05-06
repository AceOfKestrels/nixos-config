{ config, pkgs, ... }:

{
    nix.gc.automatic = true;
    nix.gc.dates = "weekly"; # or daily/hourly etc.
    nix.gc.options = "--delete-older-than 30d";
}