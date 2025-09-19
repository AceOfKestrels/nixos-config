{
    kestrel,
    config,
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
    ++ kestrel.userModules config {
        kes = ./zsh.kes.nix;
        annika = ./zsh.annika.nix;
    };

    home-manager.sharedModules = [
        enableModule
        inputs.catppuccin.homeModules.catppuccin
    ];
}
