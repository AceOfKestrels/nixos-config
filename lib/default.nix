{ system, inputs, ... }:

let
    nixpkgs = inputs.nixpkgs;
    pkgs = import nixpkgs {
        system = system;
        config.allowUnfree = true;
    };
    lib = pkgs.lib;

    importPkgs =
        p:
        import p {
            inherit system;
            config.allowUnfree = true;
        };

in
rec {
    inherit
        pkgs
        lib
        system
        ;

    assertion = {
        providesInput = name: {
            assertion = inputs ? ${name};
            message = ''
                Must provide module named "${name}" in inputs.
            '';
        };
    };

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
            ${hostname} = nixpkgs.lib.nixosSystem {
                inherit system;
                specialArgs = specialArgs // {
                    inherit inputs kestrel;
                    pkgsStable = importPkgs (inputs.nixpkgs-stable or inputs.nixpkgs);
                    pkgsUnstable = importPkgs (inputs.nixpkgs-unstable or inputs.nixpkgs);
                    pkgsMaster = importPkgs (inputs.nixpkgs-master or inputs.nixpkgs);
                };
                modules = modules ++ [
                    {
                        environment.variables.FLAKE_PATH = flakePath;
                        networking.hostName = lib.mkForce hostname;
                        nixpkgs.config.allowUnfree = lib.mkForce true;
                        nix.settings.experimental-features = [
                            "nix-command"
                            "flakes"
                        ];
                    }
                ];
            };
        };
}
