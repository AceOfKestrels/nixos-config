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
    };

    # Prefer pipewire in clients that support it
    environment.sessionVariables = {
        SDL_AUDIODRIVER = "pipewire";
        ALSOFT_DRIVERS = "pipewire,alsa,pulse";
        GST_PLUGIN_FEATURE_RANK = "pipewiresink:MAX,pulsesink:NONE";
    };
}
