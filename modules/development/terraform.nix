{ config, pkgs, ... }:

{
    nixpkgs.overlays = [
        (self: super: {
        freelens = super.stdenv.mkDerivation rec {
            pname = "freelens";
            version = "1.4.0";

            src = super.fetchurl {
                url = "https://github.com/freelensapp/freelens/releases/download/v1.4.0/Freelens-1.4.0-linux-amd64.deb";
                sha256 = "1gg1cm34rzll5pdv5v6fqgg9k6lkh9vhfg9mikd7glmifzvsrrp3";
            };

            nativeBuildInputs = [ super.dpkg super.makeWrapper ];

            unpackPhase = ''
                dpkg-deb -x $src .
            '';

            installPhase = ''
                mkdir -p $out/bin
                install -Dm755 ./opt/Freelens/freelens $out/bin/freelens

                # Install .desktop file
                mkdir -p $out/share/applications
                install -Dm644 ./usr/share/applications/freelens.desktop $out/share/applications/freelens.desktop

                # Install icons
                mkdir -p $out/share/icons
                cp -r ./usr/share/icons/hicolor $out/share/icons/

                # Wrap binary if needed
                wrapProgram $out/bin/freelens \
                    --prefix PATH : ${super.lib.makeBinPath [ super.coreutils ]}
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
