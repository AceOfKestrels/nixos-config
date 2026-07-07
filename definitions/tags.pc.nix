{ kestrix, ... }:

let
    shared = [
        ../modules/utility/printing.nix
    ];

    annika = [
        ../modules/development/terraform.nix
        ../modules/development/php.home.nix
        ../modules/development/java.home.nix
        ../modules/programs/teamspeak.home.nix
        ../modules/programs/teamviewer.nix
        ../modules/programs/onlyoffice.home.nix
        ../modules/utility/video.nix
        ../modules/gaming/ckan.nix
    ];

    kes = [
        ../modules/programs/flatpak.nix
    ];

    mel = [ ];
in
{
    imports = kestrix.tagged {
        kes = kes ++ shared;
        annika = annika ++ shared;
        mel = mel;
    };
}
