{
    lib,
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

    home-manager.users.kes.home.stateVersion = lib.mkDefault "25.05";
    system.stateVersion = lib.mkDefault "24.11";

    security.sudo.wheelNeedsPassword = false;

    imports = [
        ../../modules/core.nix
        ../../modules/desktop/plasma6.nix

        ./drivers/amdgpu.nix

        ../../modules/gaming/minecraft.nix
        ../../modules/gaming/steam.nix

        ../../modules/development/kubernetes.nix

        ../../modules/bootloader/grub.nix
    ];

    environment.systemPackages = with pkgs; [
        ytmdesktop
        discord
        anydesk
    ];
}
