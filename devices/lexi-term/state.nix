{ lib, ... }:
{
    system.stateVersion = lib.mkDefault "24.11";
    home-manager.sharedModules = [ { home.stateVersion = lib.mkDefault "25.05"; } ];
}
