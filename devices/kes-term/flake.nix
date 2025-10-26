{
    description = "flake for kes-term. use 'sudo nixos-rebuild switch --flake /etc/nixos/nixos-config/devices/kes-term#kes-term' to apply.";

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

        kestrix = {
            url = "github:KestrelsDevelopment/KestrIx";
            inputs.nixpkgs.follows = "nixpkgs";
            inputs.home-manager.follows = "home-manager";
        };
    };

    outputs = inputs: {
        nixosConfigurations = inputs.kestrix.mkConfig {
            system = "x86_64-linux";
            flake = ./.;
            src = "/etc/nixos/nixos-config/devices/kes-term";
            user = "kes";
            inherit inputs;
        };
    };
}
