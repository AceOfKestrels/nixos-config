{ kestrix, ... }:

let
    sharedHmModules = [
    ];
    sharedSystemModules = [
        ../modules/utility/power-management.nix
        ../modules/utility/wireguard.nix
    ];

    annikaHmModules = [
    ];
    annikaSystemModules = [ ];

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
