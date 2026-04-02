{
    ...
}:

{
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
    home-manager.users.kes = { };

    imports = [
        ../../definitions/tags.nix
        ../../modules/bootloader/grub.nix
    ];
}
