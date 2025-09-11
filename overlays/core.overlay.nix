{ kestrel, ... }:

{
    nixpkgs.overlays = kestrel.overlays.mkOverlays {
        ytmdesktop = "d179d77c139e0a3f5c416477f7747e9d6b7ec315";
        termius = "9807714d6944a957c2e036f84b0ff8caf9930bc0";
    };
}
