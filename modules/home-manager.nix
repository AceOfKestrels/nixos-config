{ ... }:

let
    # no flake.lock -> no way to roll back home manager
    # this is not great
    hmFlake = builtins.getFlake "github:nix-community/home-manager/master";
    hmModule = hmFlake.nixosModules.home-manager;
in
{
    imports = [ hmModule ];

    home-manager.useGlobalPkgs = true;
    home-manager.useUserPackages = true;

    home-manager.backupFileExtension = "backup";
}
