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
    home-manager.users.kes = { }; # needed for HM to apply config to user

    security.sudo.wheelNeedsPassword = false;

    imports = [
        ../../modules/core.nix
        ../../modules/desktop/gnome.nix

        ./drivers/amdgpu.nix

        ../../modules/gaming/minecraft.nix
        ../../modules/gaming/steam.nix

        ../../modules/bootloader/grub.nix
    ];

    environment.systemPackages = with pkgs; [
        ytmdesktop
        discord
        anydesk
    ];
}
