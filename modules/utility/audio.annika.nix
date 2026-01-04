{ pkgs, ... }:

{
    security.rtkit.enable = true;

    boot.kernelParams = [ "threadirqs" ];

    services.pipewire = {
        extraConfig.pipewire."92-low-latency" = {
            "context.properties" = {
                "default.clock.rate" = 192000;
                "default.clock.allowed-rates" = [ 192000 ];
                "default.clock.quantum" = 64;
                "default.clock.min-quantum" = 32;
                "default.clock.max-quantum" = 512;
            };
        };
    };

    environment.systemPackages = with pkgs; [
        scarlett2
        alsa-scarlett-gui
    ];
}
