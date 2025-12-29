{ pkgs, ... }:

{
    boot.kernelModules = [ "sg" ];

    environment.systemPackages = with pkgs; [
        (symlinkJoin {
            name = "handbrake-nvenc";
            paths = [ handbrake ];
            buildInputs = [ makeWrapper ];
            postBuild = ''
                wrapProgram $out/bin/HandBrakeCLI \
                  --prefix LD_LIBRARY_PATH : "/run/opengl-driver/lib"
            '';
        })
        parallel-full
        ffmpeg-full
        makemkv
        mkvtoolnix
        mediainfo-gui
        mediainfo
        vlc
        asunder
    ];
}
