{
    pkgs,
    lib,
    ...
}:

{
    imports = [
        ./terminus.nix
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
