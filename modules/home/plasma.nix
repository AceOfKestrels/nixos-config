{ inputs, ... }:

{
    home-manager.sharedModules = [ inputs.plasma-manager.homeModules.plasma-manager ];
}
