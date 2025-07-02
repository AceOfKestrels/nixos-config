{ config, pkgs, ... }:

{
  nixpkgs.overlays = [
    (self: super: {
      freelens = super.stdenv.mkDerivation {
        pname = "freelens";
        version = "1.4.0";
        src = super.fetchurl {
          url = "https://github.com/freelensapp/freelens/releases/download/v1.4.0/Freelens-1.4.0-linux-amd64.AppImage";
          sha256 = "178rdvzycs23avlhg27p579llc0rcmygmy2pg98hmdn6lp1gdx4n";
        };
        nativeBuildInputs = [ super.makeWrapper super.fuse ];
        unpackPhase = "true";
        installPhase = ''
          mkdir -p $out/bin
          cp $src $out/bin/freelens.AppImage
          chmod +x $out/bin/freelens.AppImage
          makeWrapper $out/bin/freelens.AppImage $out/bin/freelens
        '';
      };
    })
  ];

  environment.systemPackages = with pkgs; [
    terraform
    packer
    kubectl
    hcloud
    coreutils
    freelens
  ];
}
