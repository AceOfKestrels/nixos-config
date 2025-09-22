{
    kestrel,
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

        # Import 3d Printing
        ./development/3d-printing.nix

        # Import Video Tools
        ./utility/video.nix

        # Import Keybord shit
        ./development/keybord.nix
    ];

    programs.git.config = {
        user = {
            name = lib.mkForce "Annika Leonie Keggenhoff";
            email = lib.mkForce "mail@annika-keggenhoff.de";
        };
    };

    nixpkgs.overlays = kestrel.overlays.mkOverlays {
        termius = "9807714d6944a957c2e036f84b0ff8caf9930bc0";
    };

    environment.systemPackages = with pkgs; [
        discord # Install Official Discord app
        google-chrome # Install google chrom
        plex-desktop # Install Plex
        protonmail-desktop # Install Proton Mail
        termius # SSH Client
    ];
}
