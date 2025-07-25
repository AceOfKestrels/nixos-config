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
            "bluetooth"
        ];
    };
    home-manager.users.kes = {
        home.stateVersion = "25.05"; # DO NOT CHANGE
    };

    environment.systemPackages = with pkgs; [
        android-studio
    ];

    imports = [
        ../modules/kes-core.nix
    ];
}
