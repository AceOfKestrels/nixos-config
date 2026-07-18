{ ... }:

{
    nixpkgs.overlays = [
        (
            self: super:

            let
                pname = "convergence-mod-launcher";
                version = "1.0.3.1";

                src = super.fetchurl {
                    url = "https://github.com/The-Convergence-Team/ConvergenceER-Public/releases/download/${version}/ConvergenceLauncher_linux.AppImage";
                    sha256 = "0r6ghqkbr62qicp5dq9hqrlkjbk9g5jq065fanlaqi27ixkjnnfq";
                };
            in
            {
                convergence-mod-launcher = super.appimageTools.wrapType2 {
                    inherit version pname src;

                    extraPkgs =
                        pkgs: with pkgs; [
                            icu
                        ];
                };
            }
        )
    ];
}
