{
    pkgs,
    lib,
    inputs,
    ...
}:

{
    imports = [
        inputs.home-manager.nixosModules.home-manager

        # Import Hardware
        ./hardware.nix

        # Import Nvidia Drivers
        ../../drivers/nvidia.nix

        # Load Printer Drivers and Set Them up
        ../../drivers/printing.nix

        # Load Audio Drivers and Set Them up
        ../../drivers/audio.nix

        # Load Desktop Environment
        ../../../modules/desktop/gnome.nix

        # Load Core Configurations
        ../../../modules/core.nix

        # Setup Libvirt VM Manager
        ../../software/libvirt.nix

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
        ../../software/citrix-ica-client.nix

        # Load NAS Mount
        ../../drivers/nasdrive.nix

        # Add Tor Broser
        ../../software/tor/tor.nix

        # add Scarab
        ../../software/scarab.nix
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

    home-manager.users.annika = {
        home.stateVersion = "25.05"; # DO NOT CHANGE

        # Add Tor Broser
        imports = [ ../../software/tor/tor.home.nix ];
    };

    environment.variables = {
        KES_NIX_CONFIGS_DIR = lib.mkForce "/etc/nixos/nixos-config";
    };

    system.stateVersion = "24.11"; # Did you read the comment?

    environment.systemPackages = with pkgs; [
        teamspeak3
        remmina
        teamviewer
        drawio
        nano
    ];
}
