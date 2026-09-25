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
            "netbird"
            "netbird-wt0"
        ];
    };
    home-manager.users.kes = { };
}
