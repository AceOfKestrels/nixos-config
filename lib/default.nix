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
        lib.callPackageWith {
            inherit
                inputs
                pkgs
                lib
                system
                assertions
                overlays
                config
                ;
            importModule = importModule;
        } m { };

    assertions = importModule ./assertions.nix;
    overlays = importModule ./overlays.nix;
    config = importModule ./config.nix;
in
{
    inherit
        pkgs
        lib
        system
        assertions
        overlays
        config
        ;
}
