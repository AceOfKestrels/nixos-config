{
    kestrix,
    inputs,
    ...
}:

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
    ]
    ++ kestrix.taggedFoUser {
        kes = [ ./catppuccin.home.nix ];
        annika = [ ./catppuccin.home.nix ];
    };

    home-manager.sharedModules = [
        enableModule
        inputs.catppuccin.homeModules.catppuccin
    ];
}
