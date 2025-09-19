{
    system,
    inputs,
    lib,
    pkgs,
    ...
}:

let
    importPkgs =
        p:
        import p {
            inherit system;
            config = pkgs.config;
        };
in
{
    mkConfig =
        {
            flakePath,
            kestrel,
            modules ? [ ],
            specialArgs ? { },
            hostname ? builtins.baseNameOf flakePath,
            ...
        }:
        {
            ${hostname} = inputs.nixpkgs.lib.nixosSystem {
                inherit system;
                specialArgs = specialArgs // {
                    inherit inputs kestrel;
                    pkgsStable = importPkgs (inputs.nixpkgs-stable or inputs.nixpkgs);
                    pkgsUnstable = importPkgs (inputs.nixpkgs-unstable or inputs.nixpkgs);
                    pkgsMaster = importPkgs (inputs.nixpkgs-master or inputs.nixpkgs);
                };
                modules = modules ++ [
                    ../../modules/home-manager.nix
                    {
                        environment.variables.FLAKE_PATH = flakePath;
                        networking.hostName = lib.mkForce hostname;
                        nixpkgs.config = pkgs.config;
                        nix.settings.experimental-features = [
                            "nix-command"
                            "flakes"
                        ];
                    }
                ];
            };
        };

    mkHome =
        args@{ ... }:
        {
            imports = [ ../../modules/home-manager.nix ];
            home-manager.sharedModules = [ args ];
        };
}
