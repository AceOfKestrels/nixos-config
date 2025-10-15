{
    system,
    inputs,
    lib,
    pkgs,
    hm,
    user,
    flake,
    flakePath,
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
            kestrel,
            modules ? [ ],
            specialArgs ? { },
            hostname ? builtins.baseNameOf flake,
            ...
        }:
        {
            ${hostname} = inputs.nixpkgs.lib.nixosSystem {
                inherit system;
                specialArgs = specialArgs // {
                    inherit
                        inputs
                        kestrel
                        lib
                        hm
                        ;
                    pkgsStable = importPkgs (inputs.nixpkgs-stable or inputs.nixpkgs);
                    pkgsUnstable = importPkgs (inputs.nixpkgs-unstable or inputs.nixpkgs);
                    pkgsMaster = importPkgs (inputs.nixpkgs-master or inputs.nixpkgs);
                };
                modules = modules ++ [
                    (flake + "/device.nix")
                    (flake + "/hardware.nix")
                    (flake + "/state.nix")
                    inputs.home-manager.nixosModules.home-manager
                    ../options/options.nix
                    {
                        environment.variables.FLAKE_PATH = lib.mkDefault flakePath;
                        networking.hostName = lib.mkForce hostname;
                        nixpkgs.config = pkgs.config;
                        nix.settings.experimental-features = [
                            "nix-command"
                            "flakes"
                        ];

                        home-manager = {
                            useGlobalPkgs = lib.mkDefault true;
                            useUserPackages = lib.mkDefault true;
                            backupFileExtension = lib.mkDefault "backup";
                        };
                    }
                ];
            };
        };

    mkHome = m: {
        home-manager.sharedModules = [ m ];
    };

    userModules =
        {
            kes ? { },
            annika ? { },
            lexi ? { },
            ...
        }:
        (lib.optional (user == "kes") kes)
        ++ (lib.optional (user == "annika") annika)
        ++ (lib.optional (user == "lexi") lexi);
}
