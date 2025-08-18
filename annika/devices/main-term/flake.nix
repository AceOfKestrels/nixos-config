{
    description = "flake for annika-main-term. use 'sudo nixos-rebuild switch --flake /etc/nixos/nixos-config/annika/devices/main-term#main-term' to apply.";

    inputs = {
        nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
        catppuccin.url = "github:catppuccin/nix";
        home-manager = {
            url = "github:nix-community/home-manager";
            inputs.nixpkgs.follows = "nixpkgs";
        };
        lanzaboote.url = "github:nix-community/lanzaboote";
    };
    outputs =
        inputs@{
            self,
            nixpkgs,
            home-manager,
            catppuccin,
            lanzaboote,
            ...
        }:
        let
            hostname = "main-term";
        in
        {
            nixosConfigurations.${hostname} = nixpkgs.lib.nixosSystem {
                system = "x86_64-linux";
                specialArgs = {
                    inherit
                        inputs
                        ;
                };
                modules = [
                    lanzaboote.nixosModules.lanzaboote

                    ./device.nix
                    {
                        environment.variables.FLAKE_PATH = "/etc/nixos/nixos-config/annika/devices/main-term";
                        networking.hostName = nixpkgs.lib.mkForce hostname;
                        nix.settings.experimental-features = [
                            "nix-command"
                            "flakes"
                        ];
                    }
                ];
            };
        };
}
