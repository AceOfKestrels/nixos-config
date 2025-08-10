{ ... }:

let
    cnEnable =
        { ... }:
        {
            catppuccin.enable = true;
            catppuccin.flavor = "mocha"; # latte | frappe | macchiato | mocha
        };

    cnFromFlake =
        { inputs, ... }:
        {
            imports = [ inputs.catppuccin.nixosModules.catppuccin ];
            home-manager.sharedModules = [ inputs.catppuccin.homeModules.catppuccin ];
        };

    cnFromChannel =
        { ... }:
        {
            imports = [ <catppuccin/modules/nixos> ];
            home-manager.sharedModules = [ <catppuccin/modules/home-manager> ];
            catppuccin.tty.enable = false; # broken in channel build atm
        };

    cnModule =
        if (builtins.tryEval <catppuccin/modules/home-manager>).success then cnFromChannel else cnFromFlake;
in
{
    imports = [
        cnModule
        cnEnable
        ../home-manager.nix
    ];

    home-manager.sharedModules = [ cnEnable ];
}
