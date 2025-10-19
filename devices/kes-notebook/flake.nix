{
    description = "flake for kes-term. use 'sudo nixos-rebuild switch --flake /etc/nixos/nixos-config/devices/kes-notebook#kes-notebook' to apply.";

    inputs = {
        nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
        # nixpkgs-stable.url = "github:NixOS/nixpkgs/nixos-25.05";
        # nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixos-unstable";
        # nixpkgs-master.url = "github:NixOS/nixpkgs/master";

        catppuccin = {
            url = "github:catppuccin/nix";
            inputs.nixpkgs.follows = "nixpkgs";
        };
        shell-sources = {
            url = "github:AceOfKestrels/shell-sources";
            inputs.nixpkgs.follows = "nixpkgs";
        };

        kestrix = {
            url = "github:KestrelsDevelopment/KestrIx";
            inputs.nixpkgs.follows = "nixpkgs";
        };
    };

    outputs = inputs: {
        nixosConfigurations = inputs.kestrix.mkConfig {
            system = "x86_64-linux";
            flake = ./.;
            src = "/etc/nixos/nixos-config/devices/kes-notebook";
            user = "kes";
            inherit inputs;
        };
    };
}
