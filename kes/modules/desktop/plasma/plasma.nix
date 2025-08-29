{ ... }:
{
    imports = [
        ../../../../modules/desktop/kde-plasma.nix
        ../../../../modules/home/plasma-manager.nix
    ];

    home-manager.sharedModules = [
        ./plasma.home.nix
    ];
}
