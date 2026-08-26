{
    description = "flake for kes-term. use 'sudo nixos-rebuild switch --flake /etc/nixos/nixos-config/devices/kes-term#kes-term' to apply.";

    inputs = {
        nixpkgs-stable.url = "github:NixOS/nixpkgs/nixos-26.05";
        nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixos-unstable";
        nixpkgs-master.url = "github:NixOS/nixpkgs/master";

        nixpkgs.follows = "nixpkgs-unstable";

        home-manager = {
            url = "git+https://github.com/nix-community/home-manager.git?shallow=1&ref=master";
            inputs.nixpkgs.follows = "nixpkgs";
        };

        shell-sources = {
            url = "git+https://github.com/AceOfKestrels/shell-sources.git?shallow=1&ref=main";
            inputs.nixpkgs.follows = "nixpkgs";
        };

        plasma-manager = {
            url = "git+https://github.com/nix-community/plasma-manager.git?shallow=1&ref=trunk";
            inputs.nixpkgs.follows = "nixpkgs";
            inputs.home-manager.follows = "home-manager";
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
            src = "/etc/nixos/nixos-config/devices/kes-term";
            modules = [ ../../definitions/tags.nix ];
            tags = [
                "pc"
                "kes"
                "annika"
                "grub"
                "amdgpu"
                "plasma"
            ];
            inherit inputs;
        };
    };
}
