{
    lib,
    pkgs,
    ...
}:

{
    boot.kernelPackages = pkgs.linuxPackages_zen;

    networking.hostName = "kes-notebook";

    users.users.kes = {
        isNormalUser = true;
        description = "Kessandra";
        extraGroups = [
            "networkmanager"
            "wheel"
            "bluetooth"
        ];
    };

    home-manager.users.kes.home.stateVersion = lib.mkDefault "25.05";
    system.stateVersion = lib.mkDefault "24.11";

    environment.systemPackages = with pkgs; [
        android-studio
    ];

    imports = [
        ../../modules/core.nix
        ../../modules/desktop/gnome.nix
        ../../modules/utility/power-management.nix

        ../../modules/bootloader/grub.nix
    ];
}
