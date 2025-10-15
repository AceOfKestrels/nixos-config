{ lib, ... }:
{
    system.stateVersion = lib.mkDefault "25.05";
    home-manager.sharedModules = [ { home.stateVersion = lib.mkDefault "25.11"; } ];
}
