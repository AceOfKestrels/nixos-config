{
    description = "flake for annika-main-term. use 'sudo nixos-rebuild switch --flake /etc/nixos/nixos-config/devices/main-term#main-term' to apply.";

    inputs = {
        nixpkgs = {
            url = "git+https://github.com/NixOS/nixpkgs.git?shallow=1&ref=nixos-unstable";
        };
        nixpkgs-stable = {
            url = "git+https://github.com/NixOS/nixpkgs.git?shallow=1&ref=nixos-25.05";
        };
        nixpkgs-unstable = {
            url = "git+https://github.com/NixOS/nixpkgs.git?shallow=1&ref=nixos-unstable";
        };
        nixpkgs-master = {
            url = "git+https://github.com/NixOS/nixpkgs.git?shallow=1&ref=master";
        };
        catppuccin = {
            url = "git+https://github.com/catppuccin/nix.git?shallow=1&ref=main";
            inputs.nixpkgs.follows = "nixpkgs";
        };
        home-manager = {
            url = "git+https://github.com/nix-community/home-manager.git?shallow=1&ref=master";
            inputs.nixpkgs.follows = "nixpkgs";
        };
        flake-compat = {
            url = "git+https://github.com/NixOS/flake-compat?shallow=1&ref=master";
            flake = false;
        };
        gitignore = {
            url = "git+https://github.com/hercules-ci/gitignore.nix?shallow=1&ref=master";
            inputs = {
                nixpkgs.follows = "nixpkgs";
            };
        };
        pre-commit = {
            url = "git+https://github.com/cachix/pre-commit-hooks.nix?shallow=1&ref=master";
            inputs = {
                nixpkgs.follows = "nixpkgs";
                gitignore.follows = "gitignore";
                flake-compat.follows = "flake-compat";
            };
        };
        crane = {
            url = "git+https://github.com/ipetkov/crane?shallow=1&ref=master";
        };
        rust-overlay = {
            url = "git+https://github.com/oxalica/rust-overlay?shallow=1&ref=master";
            inputs = {
                nixpkgs.follows = "nixpkgs";
            };
        };
        lanzaboote = {
            url = "git+https://github.com/nix-community/lanzaboote.git?shallow=1&ref=master";
            inputs = {
                nixpkgs.follows = "nixpkgs";
                pre-commit.follows = "pre-commit";
                crane.follows = "crane";
                rust-overlay.follows = "rust-overlay";
            };
        };
        shell-sources = {
            url = "git+https://github.com/AceOfKestrels/shell-sources.git?shallow=1&ref=main";
            inputs = {
                nixpkgs.follows = "nixpkgs";
            };
        };
        kestrix = {
            url = "git+https://github.com/KestrelsDevelopment/KestrIx.git?shallow=1&ref=main";
            inputs = {
                nixpkgs.follows = "nixpkgs";
                nixpkgs-stable.follows = "nixpkgs-stable";
                nixpkgs-unstable.follows = "nixpkgs-unstable";
                nixpkgs-master.follows = "nixpkgs-master";
                home-manager.follows = "home-manager";
            };
        };
        flake-utils = {
            url = "git+https://github.com/numtide/flake-utils.git?shallow=1&ref=main";
        };
        nvidia-patch = {
            url = "git+https://github.com/icewind1991/nvidia-patch-nixos.git?shallow=1&ref=main";
            inputs = {
                utils.follows = "flake-utils";
                nixpkgs.follows = "nixpkgs";
            };
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
