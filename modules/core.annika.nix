{ pkgs, ... }:

{
    imports = [
        # Setup Libvirt VM Manager
        ./utility/libvirt.nix

        # Setup Dev Envierments
        ./development/docker.nix
        ./development/dotnet.nix
        ./development/python.nix
        ./development/webdev.nix
        ./development/kubernetes.nix

        # Setup Gaming Stuff
        ./gaming/minecraft.nix
        ./gaming/steam.nix

        # installl ica clie
        #./utility/citrix-ica-client.nix

        # Add Tor Broser
        ./security/tor/tor.nix

        # Import 3d Printing
        ./development/3d-printing.nix

        # Import Video Tools
        ./utility/video.nix

        # Import Keybord shit
        ./development/keybord.nix

        ./terminal/termius.nix
    ];

    environment.systemPackages = with pkgs; [
        discord # Install Official Discord app
        google-chrome # Install google chrom
        plex-desktop # Install Plex
        protonmail-desktop # Install Proton Mail
    ];
}
