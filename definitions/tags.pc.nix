{ kestrix, ... }:

let
    sharedHmModules = [
    ];
    sharedSystemModules = [
    ];

    annikaHmModules = [
        ../modules/development/php.home.nix
    ];
    annikaSystemModules = [
        ../modules/development/terraform.nix
    ];

    kesHmModules = [
    ];
    kesSystemModules = [
    ];

    melHmModules = [ ];
    melSystemModules = [ ];
in
{
    imports =
        kestrix.taggedForUser {
            kes = sharedHmModules ++ kesHmModules;
            annika = sharedHmModules ++ annikaHmModules;
            mel = melHmModules;
        }
        ++ kestrix.tagged {
            kes = sharedSystemModules ++ annikaSystemModules;
            annika = sharedSystemModules ++ kesSystemModules;
            mel = melSystemModules;
        };
}
