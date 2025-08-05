{
    pkgs,
    hostname,
    modulesPath,
    lib,
    config,
    ...
}:

{
    boot.kernelPackages = pkgs.linuxPackages_zen;

    networking.hostName = hostname;

    users.users.kes = {
        isNormalUser = true;
        description = "Kessandra";
        extraGroups = [
            "networkmanager"
            "wheel"
            "docker"
        ];
    };
    home-manager.users.kes = {
        home.stateVersion = "25.05"; # DO NOT CHANGE
    };

    security.sudo.wheelNeedsPassword = false;

    imports = [
        ../../modules/kes-core.nix

        ../../modules/amdgpu.nix

        ../../../modules/gaming/minecraft.nix
        ../../../modules/gaming/steam.nix

        ../../../modules/development/kubernetes.nix

        (modulesPath + "/installer/scan/not-detected.nix")
    ];

    environment.systemPackages = with pkgs; [
        ytmdesktop
        discord
        anydesk
    ];

    system.stateVersion = "24.11"; # do not keep this in here

    boot.initrd.availableKernelModules = [
        "xhci_pci"
        "ahci"
        "nvme"
        "usbhid"
        "usb_storage"
        "sd_mod"
        "sr_mod"
    ];
    boot.initrd.kernelModules = [ ];
    boot.kernelModules = [ "wl" ];
    #boot.extraModulePackages = [ config.boot.kernelPackages.broadcom_sta ];

    fileSystems."/" = {
        device = "/dev/disk/by-uuid/ed7646d0-853b-486c-bb8e-ae6ad9cb09f6";
        fsType = "ext4";
    };

    fileSystems."/boot" = {
        device = "/dev/disk/by-uuid/C805-D0B0";
        fsType = "vfat";
        options = [
            "fmask=0077"
            "dmask=0077"
        ];
    };

    swapDevices = [
        { device = "/dev/disk/by-uuid/04beaf53-61cb-4d77-8b35-fd9d533c27b9"; }
    ];

    # Enables DHCP on each ethernet and wireless interface. In case of scripted networking
    # (the default) this is the recommended approach. When using systemd-networkd it's
    # still possible to use this option, but it's recommended to use it in conjunction
    # with explicit per-interface declarations with `networking.interfaces.<interface>.useDHCP`.
    networking.useDHCP = lib.mkDefault true;
    # networking.interfaces.eno1.useDHCP = lib.mkDefault true;

    nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
    hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}
