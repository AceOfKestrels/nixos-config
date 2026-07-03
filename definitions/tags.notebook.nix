{ kestrix, ... }:

let
    shared = [
        ../modules/utility/power-management.nix
        ../modules/programs/wireguard.nix
    ];

    annika = [
    ];

    kes = [
        ../modules/gaming/morrowind.home.nix
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
