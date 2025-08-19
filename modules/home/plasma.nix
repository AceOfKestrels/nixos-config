{ inputs, ... }:

{
    imports = [ ../home-manager.nix ];

    home-manager.sharedModules = [ inputs.plasma-manager.homeManagerModules.plasma-manager ];
}
