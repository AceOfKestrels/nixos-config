{
    pkgs,
    lib,
    ...
}:

{
    imports = [
        # Import Nvidia Drivers
        ../drivers/nvidia.nix

        # Load Printer Drivers and Set Them up
        ../drivers/printing.nix

        # Load Audio Drivers and Set Them up
        ../drivers/audio.nix

        # Load Desktop Environment
        ../../modules/desktop/gnome.nix

        # Load Core Configurations
        ../../modules/core.nix

        # Setup Libvirt VM Manager
        ../software/libvirt.nix

        # Load Shell Aliases
        ../shell/aliases.nix

        # Setup Dev Envierments
        ../../modules/development/docker.nix
        ../../modules/development/dotnet.nix
        ../../modules/development/python.nix
        ../../modules/development/webdev.nix
        ../../modules/development/kubernetes.nix

        # Setup Gaming Stuff
        ../../modules/gaming/minecraft.nix
        ../../modules/gaming/steam.nix

        # Load my Standert Software
        ../software/standert.nix

        # installl ica clie
        ../software/citrix-ica-client.nix

        # Load NAS Mount
        ../drivers/nasdrive.nix

    ];

    # Allow unfree packages
    nixpkgs.config.allowUnfree = true;

    # Setup Bootloader.
    boot.loader.systemd-boot.enable = true;
    boot.loader.efi.canTouchEfiVariables = true;

    # Define Hostname
    networking.hostName = "main-term";

    # Seting Time Zone
    time.timeZone = "Europe/Berlin";

    # Seting internationalisation properties.
    i18n.defaultLocale = "en_US.UTF-8";

    programs.nix-ld.enable = true;

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

    # Configure keymap in X11
    services.xserver.xkb = {
        layout = "de";
        variant = "";
    };

    # Configure console keymap
    console.keyMap = "de";

    # Setup Networking
    networking.networkmanager.enable = true;

    # Define a user account. Don't forget to set a password with ‘passwd’.
    users.users.annika = {
        isNormalUser = true;
        description = "Annika Leonie Keggenhoff";
        extraGroups = [
            "networkmanager"
            "wheel"
            "docker"
            "dialout"
        ];
    };
    home-manager.users.annika = {
        home.stateVersion = "25.05"; # DO NOT CHANGE
    };

    environment.variables = {
        # Change to the actual location where you cloned the repository
        KES_NIX_CONFIGS_DIR = lib.mkForce "/etc/nixos/nixos-config";
    };

    environment.systemPackages = with pkgs; [
        teamspeak3
        remmina
        teamviewer
        drawio
    ];
}
