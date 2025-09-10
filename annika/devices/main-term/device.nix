{
    pkgs,
    lib,
    ...
}:

{
    imports = [
        # Import lanzaboote
        ../../drivers/lanzaboote.nix

        # Import Hardware
        ./hardware.nix

        # Import Nvidia Drivers
        ../../drivers/nvidia.nix

        # Load Printer Drivers and Set Them up
        ../../drivers/printing.nix

        # Load Audio Drivers and Set Them up
        ../../drivers/audio.nix

        # Load Desktop Environment
        ../../desktop/gnome/gnome.nix

        # Load Core Configurations
        ../../../modules/core.nix

        # Setup Libvirt VM Manager
        ../../../modules/development/libvirt.nix

        # Load Shell Aliases
        ../../shell/shell.nix

        # Setup Dev Envierments
        ../../../modules/development/docker.nix
        ../../../modules/development/dotnet.nix
        ../../../modules/development/python.nix
        ../../../modules/development/webdev.nix
        ../../../modules/development/kubernetes.nix

        # Setup Gaming Stuff
        ../../../modules/gaming/minecraft.nix
        ../../../modules/gaming/steam.nix

        # Load my Standert Software
        ../../software/standert.nix

        # installl ica clie
        ../../../modules/utility/citrix-ica-client.nix

        # Load NAS Mount
        ../../drivers/nasdrive.nix

        # Add Tor Broser
        ../../../modules/security/tor/tor.nix

        # add Scarab
        #../../../modules/gaming/scarab.nix

        # add catpichin
        ../../../modules/home/catppuccin.nix

        # Import 3d Printing
        ../../../modules/utility/3d-printing.nix

        # Import Video Tools
        ../../../modules/utility/video.nix
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
    ];

    services.teamviewer.enable = true;

}
