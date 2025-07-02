{ config, pkgs, ... }:

#
## IMPORTANT Before Use You need to run freelens-install to Make this Working
#
let
  appImagePath = "$HOME/.local/opt/Freelens/Freelens.AppImage";

  freelensAppImage = pkgs.fetchurl {
    url = "https://github.com/freelensapp/freelens/releases/download/v1.4.0/Freelens-1.4.0-linux-amd64.AppImage";
    sha256 = "178rdvzycs23avlhg27p579llc0rcmygmy2pg98hmdn6lp1gdx4n";
  };

  freelensIcon = pkgs.fetchurl {
    url = "https://avatars.githubusercontent.com/u/172038998?v=4";
    sha256 = "00x31wps83h9gkca5rfyvvxnzz8vm8kzcfgxlj1g12652y42n8kb";
  };
in {
  nixpkgs.overlays = [
    (self: super: {
      freelens = super.writeShellScriptBin "freelens" ''
        exec ${pkgs.appimage-run}/bin/appimage-run ${appImagePath} "$@"
      '';

      freelens-install = super.writeShellScriptBin "freelens-install" ''
        set -euo pipefail

        INSTALL_DIR="$HOME/.local/opt/Freelens"
        ICON_DIR="$HOME/.local/share/icons/hicolor/128x128/apps"
        DESKTOP_DIR="$HOME/.local/share/applications"
        WRAPPER_DIR="$HOME/.local/bin"

        EXEC_PATH="$INSTALL_DIR/Freelens.AppImage"
        ICON_PATH="$ICON_DIR/freelens.png"
        DESKTOP_PATH="$DESKTOP_DIR/freelens.desktop"

        echo "Installing Freelens..."

        mkdir -p "$INSTALL_DIR" "$ICON_DIR" "$DESKTOP_DIR" "$WRAPPER_DIR"

        cp ${freelensAppImage} "$EXEC_PATH"
        chmod +x "$EXEC_PATH"

        cp ${freelensIcon} "$ICON_PATH"

        cat > "$DESKTOP_PATH" <<EOF
[Desktop Entry]
Name=Freelens
Exec=freelens %U
Icon=freelens
Type=Application
Categories=Graphics;Photography;
Terminal=false
EOF

        gtk-update-icon-cache "$HOME/.local/share/icons/hicolor" || true

        echo "Freelens installed."
      '';
    })
  ];

  environment.systemPackages = with pkgs; [
    freelens
    freelens-install
    appimage-run
    terraform
    packer
    kubectl
    hcloud
    coreutils
  ];
}
