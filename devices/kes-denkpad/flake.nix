{
    description = "flake for kes-term. use 'sudo nixos-rebuild switch --flake /etc/nixos/nixos-config/devices/kes-denkpad#kes-denkpad' to apply.";

    inputs = {
        nixpkgs-stable.url = "git+https://github.com/NixOS/nixpkgs.git?shallow=1&ref=nixos-25.05";
        nixpkgs-unstable.follows = "nixpkgs";
        nixpkgs-master.url = "git+https://github.com/NixOS/nixpkgs.git?shallow=1&ref=master";

        nixpkgs.url = "git+https://github.com/NixOS/nixpkgs.git?shallow=1&ref=nixos-unstable";

        home-manager = {
            url = "git+https://github.com/nix-community/home-manager.git?shallow=1&ref=master";
            inputs.nixpkgs.follows = "nixpkgs";
        };

        catppuccin = {
            inputs.nixpkgs.follows = "nixpkgs";
        };

        shell-sources = {
            url = "git+https://github.com/AceOfKestrels/shell-sources.git?shallow=1&ref=main";
            inputs.nixpkgs.follows = "nixpkgs";
        };

        kestrix = {
            url = "git+https://github.com/KestrelsDevelopment/KestrIx.git?shallow=1&ref=dev";
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
            src = "/etc/nixos/nixos-config/devices/kes-denkpad";
            user = "kes";
            inherit inputs;
        };
    };
}
