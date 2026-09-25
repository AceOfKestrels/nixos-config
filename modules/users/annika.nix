{ ... }:

{
    users.users.annika = {
        isNormalUser = true;
        description = "Annika Leonie Keggenhoff";
        extraGroups = [
            "networkmanager"
            "wheel"
            "docker"
            "dialout"
            "libvirtd"
            "clamav"
            "netbird"
            "netbird-wt0"
        ];
    };
    home-manager.users.annika = { };
}
