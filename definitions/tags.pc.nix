{ kestrix, ... }:

let
    shared = [
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
