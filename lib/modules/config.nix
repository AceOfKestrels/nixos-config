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
            flake,
            kestrel,
            modules ? [ ],
            specialArgs ? { },
            hostname ? flake,
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
                    ../../devices/${flake}/device.nix
                    ../../devices/${flake}/hardware.nix
                    {
                        environment.variables.FLAKE_PATH = (/etc/nixos/nixos-config/devices + flake);
                        networking.hostName = lib.mkForce hostname;
                        nixpkgs.config = pkgs.config;
                        nix.settings.experimental-features = [
                            "nix-command"
                            "flakes"
                        ];
                        userModules = lib.mkOption {
                            default = false;
                            type = lib.types.string;
                        };
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

    userModules =
        config:
        {
            kes ? { },
            annika ? { },
            ...
        }:
        lib.optional (config.userModules == "kes") [ kes ]
        ++ lib.optional (config.userModules == "annika") [ annika ];
}
