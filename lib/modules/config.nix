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
                    ../../modules/home-manager.nix
                    (flake + "/device.nix")
                    (flake + "/hardware.nix")
                    (flake + "/state.nix")
                    {
                        environment.variables.FLAKE_PATH = lib.mkDefault flakePath;
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

    mkHome = m: {
        home-manager.sharedModules = [ m ];
    };

    userModules =
        {
            kes ? { },
            annika ? { },
            ...
        }:
        (lib.optional (user == "kes") kes) ++ (lib.optional (user == "annika") annika);
}
