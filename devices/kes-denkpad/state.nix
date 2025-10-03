{ lib, ... }:
{
    system.stateVersion = lib.mkDefault "25.11";
    home-manager.sharedModules = [ { home.stateVersion = lib.mkDefault "25.11"; } ];
}
