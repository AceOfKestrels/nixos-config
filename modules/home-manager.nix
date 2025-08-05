{
    lib,
    flakeInputs ? { },
    ...
}:

let
    hmModule =
        if lib.hasAttr "home-manager" flakeInputs then
            flakeInputs.home-manager.nixosModules.home-manager
        else
            import <home-manager/nixos>;
in
{
    imports = [ hmModule ];

    home-manager.useGlobalPkgs = true;
    home-manager.useUserPackages = true;

    home-manager.backupFileExtension = "backup";
}
