{
    pkgs,
    ...
}:

{
    boot.kernelPackages = pkgs.linuxPackages_zen;

    networking.hostName = "nixos";

    users.users.kes = {
        isNormalUser = true;
        description = "Kessandra";
        extraGroups = [
            "networkmanager"
            "wheel"
            "docker"
        ];
    };
    home-manager.users.kes = {
        home.stateVersion = "25.05"; # DO NOT CHANGE
    };

    security.sudo.wheelNeedsPassword = false;

    imports = [
        ../modules/kes-core.nix

        ../modules/amdgpu.nix

        ../../modules/gaming/minecraft.nix
        ../../modules/gaming/steam.nix

        ../../modules/development/kubernetes.nix
    ];

    environment.systemPackages = with pkgs; [
        ytmdesktop
        discord
        anydesk
    ];
}
