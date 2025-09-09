{
    description = "flake for kes-term. use 'sudo nixos-rebuild switch --flake /etc/nixos/nixos-config/kes/devices/kes-term#kes-term' to apply.";

    inputs = {
        nixpkgs.url = "github:NixOS/nixpkgs/master";
        home-manager = {
            url = "github:nix-community/home-manager";
            inputs.nixpkgs.follows = "nixpkgs";
        };
        plasma-manager = {
            url = "github:nix-community/plasma-manager";
            inputs.nixpkgs.follows = "nixpkgs";
            inputs.home-manager.follows = "home-manager";
        };
        catppuccin = {
            url = "github:catppuccin/nix";
            inputs.nixpkgs.follows = "nixpkgs";
        };
        nixpkgs-stable.url = "github:NixOS/nixpkgs/nixos-25.05";
    };
    outputs =
        inputs@{
            self,
            nixpkgs,
            home-manager,
            plasma-manager,
            catppuccin,
            ...
        }:
        let
            system = "x86_64-linux";
            importPkgs =
                p:
                import p {
                    system = system;
                    config.allowUnfree = true;
                };
            hostname = "kes-term";
        in
        {
            nixosConfigurations.${hostname} = nixpkgs.lib.nixosSystem {
                inherit system;
                specialArgs = {
                    inherit
                        inputs
                        ;
                    pkgsStable = importPkgs inputs.nixpkgs-stable;
                };
                modules = [
                    ./device.nix
                    ./hardware-configuration.nix
                    {
                        environment.variables.FLAKE_PATH = "/etc/nixos/nixos-config/kes/devices/kes-term";
                        networking.hostName = nixpkgs.lib.mkForce hostname;
                        nix.settings.experimental-features = [
                            "nix-command"
                            "flakes"
                        ];
                    }
                ];
            };
        };
}
