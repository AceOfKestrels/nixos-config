{ inputs, ... }:

{
    imports = [ ../home-manager.nix ];

    home-manager.sharedModules = [ inputs.plasma-manager.homeModules.plasma-manager ];
}
