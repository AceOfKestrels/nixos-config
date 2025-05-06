{
  config, pkgs, ... 
}:

{
  # NVIDIA driver setup
  services.xserver.videoDrivers = [ "nvidia" ];

  hardware.graphics = {
    enable = true;
    enable32Bit = true;

    extraPackages = with pkgs; [
      vulkan-loader
    ];

    extraPackages32 = with pkgs.pkgsi686Linux; [
      vulkan-loader
    ];
  };

  hardware.nvidia = {
    modesetting.enable = true;
    powerManagement.enable = false;
    powerManagement.finegrained = false;
    open = false;
    nvidiaSettings = true;
    package = config.boot.kernelPackages.nvidiaPackages.latest;
  };

  # Ensure Vulkan and NVIDIA-specific OpenGL driver paths are available
  environment.systemPackages = with pkgs; [
    vulkan-tools
    vulkan-loader
    glxinfo
  ];

  environment.variables.VK_ICD_FILENAMES = "/run/opengl-driver-32/share/vulkan/icd.d/nvidia_icd.i686.json:/run/opengl-driver/share/vulkan/icd.d/nvidia_icd.x86_64.json";


}
