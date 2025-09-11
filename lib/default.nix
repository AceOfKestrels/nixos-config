{ system, inputs, ... }:

let
    nixpkgs = inputs.nixpkgs;
    pkgs = import nixpkgs {
        system = system;
        config.allowUnfree = true;
    };
    lib = pkgs.lib;

    importModule =
        m:
        lib.callPackageWith (
            {
                inherit
                    inputs
                    pkgs
                    lib
                    system
                    importModule
                    importModules
                    ;
            }
            // imports
        ) m { };

    importModules = lib.mapAttrs (name: value: (importModule value));

    imports = importModules {
        assertions = ./assertions.nix;
        overlays = ./overlays.nix;
        config = ./config.nix;
    };
in
{
    inherit
        pkgs
        lib
        system
        ;
}
// imports
