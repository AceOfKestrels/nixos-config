{ ... }:

{
    nixpkgs.overlays = [
        (
            self: super:

            let
                pname = "snapmaker-orca";
                version = "2.3.5";

                src = super.fetchurl {
                    url = "https://cdn.snapmaker.com/software/orca/${version}/Snapmaker_Orca_Linux_AppImage_Ubuntu2404_V${version}.AppImage";
                    sha256 = "1rzn40i5myb6yz0ps8v0xn51xzy7ld8jwzm1zyav4sk6f9xiirm2";
                };
            in
            {
                ${pname} = super.appimageTools.wrapType2 {
                    inherit version pname src;

                    # extraPkgs =
                    #     pkgs: with pkgs; [
                    #         icu
                    #     ];
                };
            }
        )
    ];
}
