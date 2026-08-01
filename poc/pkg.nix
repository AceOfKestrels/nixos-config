{ inputs, ... }:

{
    nixpkgs.overlays = [
        (
            self: super:
            let
                src = builtins.getFlake "git+http://localhost:8080/my-repo?ref=main&rev=c3e02778c8c9f0ebd8ef24ce8de8dddff29dcd12&shallow=1";
            in
            {
                flatpak-poc = super.stdenv.mkDerivation {
                    pname = "flatpak-poc";
                    version = "1.0.0";
                    inherit src;

                    buildInputs = [ super.curl ];

                    installPhase = ''
                        echo "SRC: ${src}"

                        mkdir -p $out/bin
                        echo "#!/bin/sh" > $out/bin/my-pkg
                        echo "echo 'Running package built against revision ${inputs.nixpkgs.rev}'" >> $out/bin/my-pkg
                        chmod +x $out/bin/my-pkg
                    '';
                };
            }
        )
    ];
}
