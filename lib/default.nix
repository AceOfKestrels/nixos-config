{ system, nixpkgs, ... }:

let
    pkgs = import nixpkgs {
        system = system;
        config.allowUnfree = true;
    };
    lib = pkgs.lib;
in
{
    inherit pkgs;
    inherit lib;
    inherit system;

    importPkgs =
        p:
        import p {
            inherit system;
            config.allowUnfree = true;
        };

    mkDefaultModule =
        hostname: flakePath:
        { lib, ... }:
        {
            environment.variables.FLAKE_PATH = flakePath;
            networking.hostName = nixpkgs.lib.mkForce hostname;
            nix.settings.experimental-features = [
                "nix-command"
                "flakes"
            ];
            _module.args.pkgsStable = lib.mkDefault pkgs;
            _module.args.pkgsUnstable = lib.mkDefault pkgs;
            _module.args.pkgsMaster = lib.mkDefault pkgs;
        };
}
