{
    description = "flake for kes-term. use 'sudo nixos-rebuild switch --flake /etc/nixos/nixos-config/devices/kes-notebook#kes-notebook' to apply.";

    inputs = {
        nixpkgs.url = "git+https://github.com/NixOS/nixpkgs.git?shallow=1&ref=nixos-unstable";
        # nixpkgs-stable.url   = "git+https://github.com/NixOS/nixpkgs.git?shallow=1&ref=nixos-25.05";
        # nixpkgs-unstable.url = "git+https://github.com/NixOS/nixpkgs.git?shallow=1&ref=nixos-unstable";
        # nixpkgs-master.url   = "git+https://github.com/NixOS/nixpkgs.git?shallow=1&ref=master";

        home-manager = {
            url = "git+https://github.com/nix-community/home-manager.git?shallow=1&ref=master";
            inputs.nixpkgs.follows = "nixpkgs";
        };

        catppuccin = {
            url = "git+https://github.com/catppuccin/nix.git?shallow=1&ref=main";
            inputs.nixpkgs.follows = "nixpkgs";
        };

        shell-sources = {
            url = "git+https://github.com/AceOfKestrels/shell-sources.git?shallow=1&ref=main";
            inputs.nixpkgs.follows = "nixpkgs";
        };

        kestrix = {
            url = "git+https://github.com/KestrelsDevelopment/KestrIx.git?shallow=1&ref=dev";
            inputs.nixpkgs.follows = "nixpkgs";
            inputs.home-manager.follows = "home-manager";
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
