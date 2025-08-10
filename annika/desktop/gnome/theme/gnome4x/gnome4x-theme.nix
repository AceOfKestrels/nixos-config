{ pkgs }:
pkgs.stdenv.mkDerivation {
    pname = "gnome-4x-themes";
    version = "git";
    src = pkgs.fetchFromGitHub {
        owner = "daniruiz";
        repo = "GNOME-4X-themes";
        rev = "master"; # or a tag/commit
        sha256 = "sha256-KSvBVi9/Jru+uWnLjzXd30URmb2nHe5/GaEKoLs1IJg="; # fill in
    };
    installPhase = ''
        mkdir -p $out/share/themes
        cp -r themes/* $out/share/themes/
    '';
}
