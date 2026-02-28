{ pkgs, kestrel, ... }:

{
    boot.kernelModules = [ "sg" ];

    environment.systemPackages = with pkgs; [
        (symlinkJoin {
            name = "ffmpeg-hw";
            paths = [ ffmpeg-full ];
            buildInputs = [ makeWrapper ];
            postBuild = ''
                wrapProgram $out/bin/ffmpeg \
                  --prefix LD_LIBRARY_PATH : "/run/opengl-driver/lib"
            '';
        })
        pkgsStable.handbrake
        parallel-full
        makemkv
        mkvtoolnix
        mediainfo-gui
        mediainfo
        vlc
        asunder
    ];

    nixpkgs.overlays = kestrel.overlays.mkOverlays {
        makemkv = "0cdfb9727daf9e1c72ed563b2e8aa58bc3dd81e7";
    };

}
