{ inputs, ... }:

let
    enableModule =
        { ... }:
        {
            catppuccin.enable = true;
            catppuccin.flavor = "mocha"; # latte | frappe | macchiato | mocha
        };
in
{
    imports = [
        enableModule
        inputs.catppuccin.nixosModules.catppuccin
        ../home-manager.nix
    ];

    home-manager.sharedModules = [ inputs.catppuccin.homeModules.catppuccin ];
}
