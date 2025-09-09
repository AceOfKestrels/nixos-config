{ system, nixpkgs, ... }:

let
    pkgs = import nixpkgs {
        system = system;
        config.allowUnfree = true;
    };
    lib = pkgs.lib;
in
rec {
    inherit pkgs;
    inherit lib;
    inherit system;

    importPkgs =
        p:
        import p {
            inherit system;
            config.allowUnfree = true;
        };

    mkHostName = flakePath: builtins.baseNameOf flakePath;

    mkDefaultModule =
        flakePath:
        { lib, ... }:
        {
            environment.variables.FLAKE_PATH = flakePath;
            networking.hostName = nixpkgs.lib.mkForce (mkHostName flakePath);
            nix.settings.experimental-features = [
                "nix-command"
                "flakes"
            ];
            _module.args.pkgsStable = lib.mkDefault pkgs;
            _module.args.pkgsUnstable = lib.mkDefault pkgs;
            _module.args.pkgsMaster = lib.mkDefault pkgs;
        };
}
