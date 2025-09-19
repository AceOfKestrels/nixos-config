{
    lib,
    pkgs,
    ...
}:

{
    boot.kernelPackages = pkgs.linuxPackages_zen;

    networking.hostName = "nixos";

    userModules = "kes";

    users.users.kes = {
        isNormalUser = true;
        description = "Kessandra";
        extraGroups = [
            "networkmanager"
            "wheel"
            "docker"
        ];
    };

    home-manager.users.kes.home.stateVersion = lib.mkDefault "25.05";
    system.stateVersion = lib.mkDefault "24.11";

    security.sudo.wheelNeedsPassword = false;

    imports = [
        ../../modules/kes-core.nix
        ../../modules/desktop/plasma.nix

        ../../modules/amdgpu.nix

        ../../../modules/gaming/minecraft.nix
        ../../../modules/gaming/steam.nix

        ../../../modules/development/kubernetes.nix
    ];

    environment.systemPackages = with pkgs; [
        ytmdesktop
        discord
        anydesk
    ];
}
