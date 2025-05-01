{ config, pkgs, ... }:

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

        # Setup Gaming Stuff
        ../../modules/gaming/minecraft.nix
        ../../modules/gaming/steam.nix

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
    i18n.defaultLocale = "de_DE.UTF-8";

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

    environment.systemPackages = with pkgs; [
        discord # Install Official Discord app
    ];
}