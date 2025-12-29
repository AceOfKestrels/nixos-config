{ pkgs, ... }:

{
    nixpkgs.overlays = [
        (import ./video.overlay.nix)
    ];

    boot.kernelModules = [ "sg" ];

    environment.systemPackages = with pkgs; [
        (symlinkJoin {
            name = "HandBrakeCLI-nvdec";
            paths = [ handbrake-hw ];
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
