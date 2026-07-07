{ kestrix, ... }:

{
    imports = kestrix.tagged {
        annika = [ ./kitty.annika.home.nix ];
        kes = [ ./kitty.kes.home.nix ];
    };
}
