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
        ];
    };
    home-manager.users.annika = { };
}
