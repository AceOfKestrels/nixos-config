{
    description = "flake to create a live usb, including a graphical installer and useful tools";

    inputs = {
        nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

        repoRoot = {
            url = "path:../../..";
            flake = false;
        };
    };
    outputs =
        inputs@{
            self,
            nixpkgs,
            repoRoot,
            ...
        }:
        let
            baseConfig = {
                system = "x86_64-linux";
                specialArgs = { inherit inputs; };
                modules = [
                    ../../modules/programs.nix
                    ../../modules/gnome.nix
                    ../../modules/locale.nix
                    {
                        networking.hostName = "nixos";
                        nix.settings.experimental-features = [
                            "nix-command"
                            "flakes"
                        ];

                        # GUI installer with Gnome DE
                        imports = [
                            "${nixpkgs}/nixos/modules/installer/cd-dvd/installation-cd-graphical-calamares-gnome.nix"
                        ];

                        # QoL
                        services.getty.autologinUser = nixpkgs.lib.mkDefault "nixos";
                        users.users.nixos.extraGroups = nixpkgs.lib.mkAfter [ "wheel" ];
                    }
                ];
            };
        in
        {
            nixosConfigurations.live-boot = nixpkgs.lib.nixosSystem baseConfig;

            nixosConfigurations.kes-term = nixpkgs.lib.nixosSystem baseConfig // {
                modules = [
                    {
                        services.calamares.settings = {
                            modules = [
                                {
                                    id = "nixosInstall";
                                    type = "shellprocess";
                                    command = "nixos-install --flake ${repoRoot}/kes/devices/kes-term#kes-term";
                                }
                            ];
                        };
                    }
                ];
            };
        };
}
