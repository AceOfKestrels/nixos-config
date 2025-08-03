{ ... }:

{
    imports = [ <home-manager/nixos> ];

    home-manager.useGlobalPkgs = true;
    home-manager.useUserPackages = true;

    home-manager.backupFileExtension = "backup";
}
