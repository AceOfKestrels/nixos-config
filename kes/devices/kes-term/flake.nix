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
        kestrel = {
            url = "path:../../../lib";
            flake = false;
        };
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
            hostname = "kes-term";
            system = "x86_64-linux";
            kestrel = import inputs.kestrel {
                inherit system;
                inherit nixpkgs;
            };
        in
        {
            nixosConfigurations.${hostname} = nixpkgs.lib.nixosSystem {
                inherit system;
                specialArgs = {
                    inherit
                        inputs
                        kestrel
                        ;
                    # pkgsStable = kestrel.importPkgs inputs.nixpkgs-stable;
                };
                modules = [
                    ./device.nix
                    ./hardware-configuration.nix
                    (kestrel.mkDefaultModule hostname "/etc/nixos/nixos-config/kes/devices/kes-term")
                ];
            };
        };
}
