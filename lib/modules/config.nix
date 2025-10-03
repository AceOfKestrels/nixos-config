{
    system,
    inputs,
    lib,
    pkgs,
    hm,
    user,
    flake,
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
            hostname ? flake,
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
                    ../../devices/${flake}/device.nix
                    ../../devices/${flake}/hardware.nix
                    ../../devices/${flake}/state.nix
                    {
                        environment.variables.FLAKE_PATH = "/etc/nixos/nixos-config/devices/${flake}";
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
            home-manager.sharedModules = [ args ];
        };

    userModules =
        {
            kes ? { },
            annika ? { },
            ...
        }:
        (lib.optional (user == "kes") kes) ++ (lib.optional (user == "annika") annika);
}
