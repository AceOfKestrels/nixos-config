{ pkgs, ... }:

{
    services.flatpak.packages = [
        rec {
            appId = "snapmaker.orca.Slicer";
            sha256 = "00qj5kxrxqf422k594nd0q4zzs9jw5b8h0ncf0hhrmrqj2ij7jcd";
            bundle = "${pkgs.fetchurl {
                url = "https://cdn.snapmaker.com/software/orca/2.3.5/Snapmaker_Orca-Linux-flatpak_V2.3.5_x86_64.flatpak";
                inherit sha256;
            }}";
        }
    ];
}
