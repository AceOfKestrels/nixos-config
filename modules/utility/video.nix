{ pkgs, ... }:

{
    boot.kernelModules = [ "sg" ];

    environment.systemPackages = with pkgs; [
        (symlinkJoin {
            name = "handbrake-hardware";
            paths = [ handbrake ];
            buildInputs = [ makeWrapper ];
            postBuild = ''
                wrapProgram $out/bin/HandBrakeCLI \
                  --prefix LD_LIBRARY_PATH : "/run/opengl-driver/lib:/run/opengl-driver-32/lib:${
                      pkgs.lib.makeLibraryPath [ pkgs.cudaPackages.cudatoolkit ]
                  }"
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
