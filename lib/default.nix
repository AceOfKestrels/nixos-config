{
    system,
    inputs,
    flake,
    user ? "",
    ...
}:

let
    nixpkgs = inputs.nixpkgs;
    pkgs = import nixpkgs {
        system = system;
        config.allowUnfree = true;
    };
    lib = pkgs.lib;
    hm = import (inputs.home-manager + "/modules/lib") { inherit lib; };

    importModule =
        m:
        lib.callPackageWith (
            {
                inherit
                    inputs
                    importModule
                    importModules
                    user
                    flake
                    ;
            }
            // exports
        ) m { };

    importModules = lib.mapAttrs (name: value: (importModule value));

    imports = importModules {
        assertions = ./modules/assertions.nix;
        overlays = ./modules/overlays.nix;
        config = ./modules/config.nix;
    };

    exports = imports // {
        inherit
            pkgs
            lib
            system
            hm
            ;
    };
in
{
    mkHome = exports.config.mkHome;
    userModules = exports.config.userModules;
}
// exports
