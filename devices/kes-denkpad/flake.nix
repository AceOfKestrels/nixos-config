{
    description = "flake for kes-term. use 'sudo nixos-rebuild switch --flake /etc/nixos/nixos-config/devices/kes-denkpad#kes-denkpad' to apply.";

    inputs = {
        nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
        # nixpkgs-stable.url = "github:NixOS/nixpkgs/nixos-25.05";
        # nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixos-unstable";
        # nixpkgs-master.url = "github:NixOS/nixpkgs/master";

        home-manager = {
            url = "github:nix-community/home-manager";
            inputs.nixpkgs.follows = "nixpkgs";
        };
        catppuccin = {
            url = "github:catppuccin/nix";
            inputs.nixpkgs.follows = "nixpkgs";
        };
        shell-sources = {
            url = "github:AceOfKestrels/shell-sources";
            inputs.nixpkgs.follows = "nixpkgs";
        };
    };

    outputs =
        inputs@{ ... }:
        let
            kestrel = import ../../lib {
                system = "x86_64-linux";
                flake = ./.;
                flakePath = "/etc/nixos/nixos-config/devices/kes-denkpad";
                user = "kes";
                inherit inputs;
            };
        in
        {
            nixosConfigurations = kestrel.config.mkConfig { inherit kestrel; };
        };
}
