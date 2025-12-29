self: super: {
    # This creates a new version of handbrake called 'handbrake-hw'
    handbrake-hw = super.handbrake.overrideAttrs (oldAttrs: {
        # 1. We ensure the nv-codec-headers are definitely included (as seen in your snippet)
        buildInputs = oldAttrs.buildInputs ++ [ self.nv-codec-headers ];

        # 2. This is the crucial missing piece: enabling the feature in the build script
        configureFlags = (oldAttrs.configureFlags or [ ]) ++ [
            "--enable-nvenc"
        ];

        # 3. We also need to tell the internal FFmpeg to support Nvidia
        passthru = (oldAttrs.passthru or { }) // {
            ffmpeg-hb = oldAttrs.passthru.ffmpeg-hb.override {
                withNvcodec = true;
            };
        };
    });
}
