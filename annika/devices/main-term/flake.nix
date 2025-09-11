{
    description = "flake for annika-main-term. use 'sudo nixos-rebuild switch --flake /etc/nixos/nixos-config/annika/devices/main-term#main-term' to apply.";

    inputs = {
        nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
        nixpkgs-stable.url = "github:NixOS/nixpkgs/nixos-25.05";
        nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixos-unstable";
        nixpkgs-master.url = "github:NixOS/nixpkgs/master";

        catppuccin = {
            url = "github:catppuccin/nix";
            inputs.nixpkgs.follows = "nixpkgs";
        };
        home-manager = {
            url = "github:nix-community/home-manager";
            inputs.nixpkgs.follows = "nixpkgs";
        };
        lanzaboote = {
            url = "github:nix-community/lanzaboote";
            inputs.nixpkgs.follows = "nixpkgs";
        };
    };

    outputs =
        inputs@{ ... }:
        let
            kestrel = import ../../../lib {
                system = "x86_64-linux";
                inherit inputs;
            };
        in
        {
            nixosConfigurations = kestrel.config.mkConfig {
                flakePath = "/etc/nixos/nixos-config/annika/devices/main-term";
                modules = [
                    ./device.nix
                ];
                inherit kestrel;
            };
        };
}
