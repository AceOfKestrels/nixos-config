{
    inputs = {
        nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    };
    outputs =
        { self, nixpkgs }:
        let
            hostname = "nixos";
        in
        {
            nixosConfigurations.${hostname} = nixpkgs.lib.nixosSystem {
                system = "x86_64-linux";
                specialArgs = {
                    inherit
                        self
                        hostname
                        ;
                };
                modules = [
                    ./desktop.nix
                    /etc/nixos/hardware-configuration.nix
                ];
            };
        };
}
