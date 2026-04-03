{ kestrix, ... }:

let
    shared = [
        ../modules/utility/power-management.nix
        ../modules/programs/wireguard.nix
    ];

    annika = [
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
