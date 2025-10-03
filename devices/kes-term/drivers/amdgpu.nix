{ pkgs, ... }:

{
    # Not strictly necessary, since it's installed implicitly by setting the video drivers
    boot.initrd.kernelModules = [ "amdgpu" ];

    services.xserver.enable = true;
    services.xserver.videoDrivers = [ "amdgpu" ];

    hardware.graphics = {
        extraPackages = with pkgs; [
            vulkan-loader
        ];

        # Same for 32 bit
        enable32Bit = true;
        extraPackages32 = with pkgs.pkgsi686Linux; [
            vulkan-loader
        ];
    };

    environment.systemPackages = with pkgs; [
        vulkan-tools
        glxinfo
        linux-firmware
    ];

    environment.variables.VK_LOADER_DRIVERS_DISABLE = "*dzn*";
}
