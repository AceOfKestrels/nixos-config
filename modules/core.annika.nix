{
    pkgs,
    lib,
    ...
}:

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
        ./utility/citrix-ica-client.nix

        # Add Tor Broser
        ./security/tor/tor.nix

        # add catpichin
        ./home-manager/catppuccin.nix

        # Import 3d Printing
        ./development/3d-printing.nix

        # Import Video Tools
        ./utility/video.nix
    ];

    programs.git.config = {
        user = {
            name = lib.mkForce "Annika Leonie Keggenhoff";
            email = lib.mkForce "mail@annika-keggenhoff.de";
        };
    };

    environment.systemPackages = with pkgs; [
        discord # Install Official Discord app
        google-chrome # Install google chrom
        plex-desktop # Install Plex
        protonmail-desktop # Install Proton Mail
        termius # SSH Client
    ];
}
