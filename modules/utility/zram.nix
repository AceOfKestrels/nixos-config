{ ... }:

{
    # Enable zram
    zramSwap = {
        enable = true;
        algorithm = "zstd";
        memoryPercent = 25;
        priority = 100;
    };
}
