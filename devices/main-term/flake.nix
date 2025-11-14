{
    description = "flake for annika-main-term. use 'sudo nixos-rebuild switch --flake /etc/nixos/nixos-config/devices/main-term#main-term' to apply.";

    inputs = {
        nixpkgs.url = "git+https://github.com/NixOS/nixpkgs.git?shallow=1&ref=nixos-unstable";
        nixpkgs-stable.url = "git+https://github.com/NixOS/nixpkgs.git?shallow=1&ref=nixos-25.05";
        nixpkgs-unstable.url = "git+https://github.com/NixOS/nixpkgs.git?shallow=1&ref=nixos-unstable";
        nixpkgs-master.url = "git+https://github.com/NixOS/nixpkgs.git?shallow=1&ref=master";

        catppuccin = {
            url = "git+https://github.com/catppuccin/nix.git?shallow=1&ref=main";
            inputs.nixpkgs.follows = "nixpkgs";
        };
        home-manager = {
            url = "git+https://github.com/nix-community/home-manager.git?shallow=1&ref=master";
            inputs.nixpkgs.follows = "nixpkgs";
        };
        lanzaboote = {
            url = "git+https://github.com/nix-community/lanzaboote.git?shallow=1&ref=master";
            inputs = {
                nixpkgs.follows = "nixpkgs";
                rust-overlay.follows = "rust-overlay";
            };
        };
        rust-overlay = {
            url = "git+https://github.com/oxalica/rust-overlay.git?shallow=1&ref=master";
            inputs.nixpkgs.follows = "nixpkgs";
        };
        shell-sources = {
            url = "git+https://github.com/AceOfKestrels/shell-sources.git?shallow=1&ref=main";
            inputs.nixpkgs.follows = "nixpkgs";
        };

        kestrix = {
            url = "git+https://github.com/KestrelsDevelopment/KestrIx.git?shallow=1&ref=main";
            inputs.nixpkgs.follows = "nixpkgs";
            inputs.nixpkgs-stable.follows = "nixpkgs-stable";
            inputs.nixpkgs-unstable.follows = "nixpkgs-unstable";
            inputs.nixpkgs-master.follows = "nixpkgs-master";
            inputs.home-manager.follows = "home-manager";
        };
    };

    outputs = inputs: {
        nixosConfigurations = inputs.kestrix.mkConfig {
            system = "x86_64-linux";
            flake = ./.;
            src = "/etc/nixos/nixos-config/devices/main-term";
            user = "annika";
            inherit inputs;
        };
    };
}
