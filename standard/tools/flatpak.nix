{ inputs, ... }:

{
    imports = [ inputs.nix-flatpak.nixosModules.nix-flatpak ];
    home-manager.sharedModules = [ inputs.nix-flatpak.homeManagerModules.nix-flatpak ];

    services.flatpak = {
        enable = true;
        uninstallUnmanaged = true;
        packages = [
            "com.github.tchx84.Flatseal" # Flatseal
        ];
    };
}
