{ config, pkgs, ... }:

{
    boot.kernelPackages = pkgs.linuxPackages_6_6;

    # Not strictly necessary, since it's installed implicitly by setting the video drivers
    boot.initrd.kernelModules = [ "amdgpu" ];

    services.xserver.enable = true;
    services.xserver.videoDrivers = [ "amdgpu" ];

    services.displayManager.defaultSession = "plasmax11";

    hardware.graphics = {
        extraPackages = with pkgs; [
            vulkan-loader
            amdvlk
        ];

        # Same for 32 bit
        enable32Bit = true;
        extraPackages32 = with pkgs.pkgsi686Linux; [
            vulkan-loader
            amdvlk
        ];
    };

    environment.systemPackages = with pkgs; [
        vulkan-tools
        glxinfo
        linux-firmware
    ];

    environment.variables.VK_LOADER_DRIVERS_DISABLE = "*dzn*";
}