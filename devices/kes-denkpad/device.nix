{
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
