{
    inputs = {
        nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
        home-manager.url = "github:nix-community/home-manager";
        home-manager.inputs.nixpkgs.follows = "nixpkgs";
    };
    outputs =
        inputs@{
            self,
            nixpkgs,
            home-manager,
        }:
        let
            hostname = "nixos";
        in
        {
            nixosConfigurations.${hostname} = nixpkgs.lib.nixosSystem {
                system = "x86_64-linux";
                specialArgs = {
                    flakeInputs = inputs;
                    inherit hostname;
                };
                modules = [
                    home-manager.nixosModules.home-manager
                    ./desktop.nix
                    {
                        environment.variables.FLAKE_PATH = "/etc/nixos/nixos-config/kes/devices/desktop";
                    }
                ];
            };
        };
}
