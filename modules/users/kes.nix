{ ... }:

{
    users.users.kes = {
        isNormalUser = true;
        description = "Kessandra";
        extraGroups = [
            "networkmanager"
            "wheel"
            "bluetooth"
            "docker"
        ];
    };
    home-manager.users.kes = { };
}
