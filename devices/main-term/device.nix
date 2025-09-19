{
    pkgs,
    lib,
    ...
}:

{
    userModules = "annika";
    imports = [
        # Import lanzaboote
        ./drivers/lanzaboote.nix

        # Import Nvidia Drivers
        ./drivers/nvidia.nix

        # Load Printer Drivers and Set Them up
        ../../modules/utility/printing.nix

        # Load Audio Drivers and Set Them up
        ../../modules/utility/audio.nix

        # Load Desktop Environment
        ../../modules/desktop/gnome.nix

        # Load Core Configurations
        ../../modules/core.nix

        # Load NAS Mount
        ./drivers/nasdrive.nix
    ];

    # Allow unfree packages
    nixpkgs.config.allowUnfree = true;

    # Bootloader
    boot.loader.systemd-boot.enable = true;
    boot.loader.efi.canTouchEfiVariables = true;

    # Hostname / locale / time
    networking.hostName = "main-term";
    time.timeZone = "Europe/Berlin";
    i18n.defaultLocale = "en_US.UTF-8";
    i18n.extraLocaleSettings = {
        LC_ADDRESS = "de_DE.UTF-8";
        LC_IDENTIFICATION = "de_DE.UTF-8";
        LC_MEASUREMENT = "de_DE.UTF-8";
        LC_MONETARY = "de_DE.UTF-8";
        LC_NAME = "de_DE.UTF-8";
        LC_NUMERIC = "de_DE.UTF-8";
        LC_PAPER = "de_DE.UTF-8";
        LC_TELEPHONE = "de_DE.UTF-8";
        LC_TIME = "de_DE.UTF-8";
    };

    programs.nix-ld.enable = true;

    # Keyboard
    services.xserver.xkb = {
        layout = "de";
        variant = "";
    };
    console.keyMap = "de";

    # Networking
    networking.networkmanager.enable = true;

    # User
    users.users.annika = {
        isNormalUser = true;
        description = "Annika Leonie Keggenhoff";
        extraGroups = [
            "networkmanager"
            "wheel"
            "docker"
            "dialout"
            "libvirtd"
        ];
    };
    users.users.kes = {
        isNormalUser = true;
        description = "Kessandra";
        extraGroups = [
            "networkmanager"
            "wheel"
            "docker"
            "dialout"
            "libvirtd"
        ];
    };

    # Set catpuchin flavor globaly
    catppuccin.flavor = lib.mkForce "macchiato";

    home-manager.users.annika = {
        home.stateVersion = "25.05"; # DO NOT CHANGE

        # Set Catpuchin flavor for user
        catppuccin.flavor = lib.mkForce "macchiato";
    };

    home-manager.users.kes = {
        home.stateVersion = "25.05"; # DO NOT CHANGE

        # Set Catpuchin flavor for user
        catppuccin.flavor = lib.mkForce "mocha";
    };

    environment.variables = {
        KES_NIX_CONFIGS_DIR = lib.mkForce "/etc/nixos/nixos-config";
    };

    system.stateVersion = "24.11"; # Did you read the comment?

    environment.systemPackages = with pkgs; [
        teamspeak6-client
        remmina
        teamviewer
        drawio
        nano
        unrar
    ];

    services.teamviewer.enable = true;

}
