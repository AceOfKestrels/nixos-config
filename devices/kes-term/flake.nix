{
    description = "flake for kes-term. use 'sudo nixos-rebuild switch --flake /etc/nixos/nixos-config/kes/devices/kes-term#kes-term' to apply.";

    inputs = {
        nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
        # nixpkgs-stable.url = "github:NixOS/nixpkgs/nixos-25.05";
        # nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixos-unstable";
        # nixpkgs-master.url = "github:NixOS/nixpkgs/master";

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
    };
    outputs =
        inputs@{ ... }:
        let
            kestrel = import ../../lib {
                system = "x86_64-linux";
                flake = "kes-term";
                user = "kes";
                inherit inputs;
            };
        in
        {
            nixosConfigurations = kestrel.config.mkConfig { inherit kestrel; };
        };
}
