{ pkgs, ... }:

{
    # Not strictly necessary, since it's installed implicitly by setting the video drivers
    boot.initrd.kernelModules = [ "amdgpu" ];

    services.xserver.enable = true;
    services.xserver.videoDrivers = [ "amdgpu" ];

    hardware.graphics = {
        extraPackages = with pkgs; [
            mesa
            vulkan-loader
        ];

        # Same for 32 bit
        enable32Bit = true;
        extraPackages32 = with pkgs.pkgsi686Linux; [
            mesa
            vulkan-loader
        ];
    };

    # Prefer RADV and hide non-hardware ICDs
    environment.variables = {
        # Hide Dozen (dzn) and llvmpipe (lvp) so games can’t “accidentally” pick them
        VK_LOADER_DRIVERS_DISABLE = "dzn,lvp";

        # Enable RADV’s Graphics Pipeline Library globally: less stutter, better DX12 perf
        RADV_PERFTEST = "gpl";
    };

    programs.gamemode.enable = true; # auto performance boosts while gaming
    environment.systemPackages = with pkgs; [
        vulkan-tools
        glxinfo
        linux-firmware
    ];
}
