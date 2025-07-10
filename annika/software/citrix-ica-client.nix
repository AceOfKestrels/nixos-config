{ pkgs, ... }:

{
    # Allow unfree packages (needed for Citrix Workspace)
    nixpkgs.config.allowUnfree = true;

    # Enable smartcard daemon
    services.pcscd.enable = true;

    # System packages
    environment.systemPackages = with pkgs; [
        citrix_workspace # Official ICA client
        opensc # Smartcard tools and libraries
        ccid # USB smartcard reader driver

        # Audio/video packages for HDX
        pulseaudio
        alsa-utils
        libvdpau
        vdpauinfo

        # GStreamer stack for HDX multimedia optimization
        gst_all_1.gstreamer
        gst_all_1.gst-plugins-base
        gst_all_1.gst-plugins-good
        gst_all_1.gst-plugins-bad
        gst_all_1.gst-plugins-ugly
        gst_all_1.gst-libav

        # MIME helper (for manual .ica association)
        xdg-utils
    ];
}
