{ ... }:

let
    pmFromFlake =
        { inputs, ... }:
        {
            home-manager.sharedModules = [ inputs.plasma-manager.homeManagerModules.plasma-manager ];
        };

    pmFromChannel =
        { ... }:
        {
            home-manager.sharedModules = [ <plasma-manager/modules> ];
        };

    pmModule =
        if (builtins.tryEval <plasma-manager/modules>).success then pmFromChannel else pmFromFlake;
in
{
    imports = [
        pmModule
        ../home-manager.nix
    ];
}
