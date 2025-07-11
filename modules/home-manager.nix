{ ... }:

let
    home-manager-src = builtins.fetchTarball {
        url = "https://github.com/nix-community/home-manager/archive/master.tar.gz";
    };
in
{
    imports = [ (import "${home-manager-src}/nixos") ];

    home-manager.useGlobalPkgs = true;
    home-manager.useUserPackages = true;

    home-manager.backupFileExtension = "backup";
}
