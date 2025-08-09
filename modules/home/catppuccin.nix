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
            home-manager.sharedModules = [
                inputs.catppuccin.homeModules.catppuccin
                cnEnable
            ];
        };

    cnFromChannel =
        { ... }:
        {
            home-manager.sharedModules = [
                <catppuccin/modules/home-manager>
                cnEnable
            ];
        };

    cnModule =
        if (builtins.tryEval <catppuccin/modules/home-manager>).success then cnFromChannel else cnFromFlake;
in
{
    imports = [
        cnModule
        ../home-manager.nix
    ];
}
