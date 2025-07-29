{ pkgs, ... }:

{
    # Allow unfree packages (needed for Citrix Workspace)
    nixpkgs.config.allowUnfree = true;

    # Enable smartcard daemon
    services.pcscd.enable = true;

    nixpkgs.config.permittedInsecurePackages = [
        "libxml2-2.13.8"
        "libsoup-2.74.3"
    ];

    # System packages
    environment.systemPackages = with pkgs; [
        # Citrix + smartcard
        citrix_workspace
        opensc
        ccid

        # Multimedia
        pulseaudio
        alsa-utils
        libvdpau
        vdpauinfo
        gst_all_1.gstreamer
        gst_all_1.gst-plugins-base
        gst_all_1.gst-plugins-good
        gst_all_1.gst-plugins-bad
        gst_all_1.gst-plugins-ugly
        gst_all_1.gst-libav
        xdg-utils
        (pkgs.stdenv.cc.cc.lib)
    ];
}
