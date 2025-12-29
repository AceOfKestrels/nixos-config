{ pkgs, ... }:

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
        handbrake
        parallel-full
        makemkv
        mkvtoolnix
        mediainfo-gui
        mediainfo
        vlc
        asunder
    ];
}
