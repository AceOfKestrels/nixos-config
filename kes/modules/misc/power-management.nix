{ ... }:
{
    # CPU frequency & EPP
    powerManagement.cpuFreqGovernor = "powersave"; # with intel_pstate this means "use EPP"

    # Prefer deep sleep (S3) if your BIOS supports it
    boot.kernelParams = [
        "mem_sleep_default=deep" # S3 instead of s2idle when possible
        "pcie_aspm=force" # enable PCIe ASPM on picky firmware
        "i915.enable_psr=1" # Panel Self Refresh (saves LCD power)
        "i915.enable_fbc=1" # Framebuffer compression
    ];

    services.tlp = {
        enable = true;
        settings = {
            CPU_ENERGY_PERF_POLICY_ON_BAT = "power";
            CPU_ENERGY_PERF_POLICY_ON_AC = "balance_performance";
            PLATFORM_PROFILE_ON_BAT = "low-power"; # if supported
            PLATFORM_PROFILE_ON_AC = "balanced";

            # SATA/NVMe/USB autosuspend
            RUNTIME_PM_ON_BAT = "auto";
            PCIE_ASPM_ON_BAT = "powersupersave";
            USB_AUTOSUSPEND = 1;
            USB_EXCLUDE_BTUSB = 0; # allow BT autosuspend; set to 1 if BT misbehaves

            # iwlwifi power save
            WIFI_PWR_ON_BAT = "y";

            # Battery charge thresholds (optional, prolongs pack life)
            # ThinkPad-specific, tweak as you like:
            START_CHARGE_THRESH_BAT0 = 40;
            STOP_CHARGE_THRESH_BAT0 = 80;
        };
    };

    # Don’t run power-profiles-daemon simultaneously
    services.power-profiles-daemon.enable = false;

    powerManagement.powertop.enable = true; # runs --auto-tune at boot
    services.thermald.enable = true; # smooths turbo/temps on 8th-gen Intel

    zramSwap = {
        enable = true;
        memoryPercent = 50; # ~8 GB compressed
        algorithm = "zstd"; # or "lz4" if you prefer lower CPU use
        priority = 100; # ensure it’s used before disk swap
    };
}
