{ kestrix, ... }:

let
    shared = [
        ../modules/utility/printing.nix
    ];

    annika = [
        ../modules/development/terraform.nix
        ../modules/development/php.home.nix
    ];

    kes = [
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
