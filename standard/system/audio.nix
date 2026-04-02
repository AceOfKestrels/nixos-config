{ ... }:

{
    # Enable sound with pipewire.
    services.pulseaudio.enable = false;
    security.rtkit.enable = true;
    services.pipewire = {
        enable = true;
        alsa.enable = true;
        alsa.support32Bit = true;
        pulse.enable = true;
        jack.enable = true;
        extraConfig.pipewire."92-low-latency" = {
            "context.properties" = {
                "default.clock.rate" = 192000;
                "default.clock.allowed-rates" = [ 192000 ];
                "default.clock.quantum" = 256;
                "default.clock.min-quantum" = 32;
                "default.clock.max-quantum" = 512;
            };
        };
    };

    boot.kernelParams = [ "threadirqs" ];

    # Prefer pipewire in clients that support it
    environment.sessionVariables = {
        SDL_AUDIODRIVER = "pipewire";
        ALSOFT_DRIVERS = "pipewire,alsa,pulse";
        GST_PLUGIN_FEATURE_RANK = "pipewiresink:MAX,pulsesink:NONE";
    };
}
