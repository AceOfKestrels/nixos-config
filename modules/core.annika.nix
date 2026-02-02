{ pkgs, ... }:

{
    imports = [
        # Setup Libvirt VM Manager
        #./utility/virt-manager.nix

        # Setup Dev Envierments
        ./development/docker.nix
        ./development/dotnet.nix
        #./development/python.nix
        ./development/webdev.nix
        #./development/kubernetes.nix
        ./development/php.nix

        # Setup Gaming Stuff
        ./gaming/minecraft.nix
        ./gaming/steam.nix

        # installl ica clie
        #./utility/citrix-ica-client.nix

        # Add Tor Broser
        ./security/tor/tor.nix

        # Import 3d Printing
        #./development/3d-printing.nix

        # Import Video Tools
        ./utility/video.nix

        # Import Keybord DevTools
        ./development/keybord.nix

        # Import Terminus
        ./terminal/termius.nix

        # Import Win Boat
        #./utility/winboat.nix

        # Import Tidal
        ./utility/tidal.nix

        #Import Ausweis App
        ./utility/ausweisapp.nix

        ./utility/lix.nix
    ];

    security.polkit.extraConfig = ''
        polkit.addRule(function(action, subject) {
          if ((action.id == "org.freedesktop.udisks2.filesystem-mount" ||
               action.id == "org.freedesktop.udisks2.filesystem-mount-system" ||
               action.id == "org.freedesktop.udisks2.filesystem-unmount-others" ||
               action.id == "org.freedesktop.udisks2.encrypted-unlock" ||
               action.id == "org.freedesktop.udisks2.eject-media" ||
               action.id == "org.freedesktop.udisks2.drive-eject" ||
               action.id == "org.freedesktop.udisks2.modify-device") &&
              subject.isInGroup("wheel")) {
            return polkit.Result.YES;
          }
        });
    '';

    environment.systemPackages = with pkgs; [
        discord # Install Official Discord app
        google-chrome # Install google chrom
        plex-desktop # Install Plex
        ausweisapp
    ];
}
