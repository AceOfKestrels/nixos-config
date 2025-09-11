{ system, lib, ... }:

let
    copyAttrByPath =
        path: source: if path == [ ] then { } else lib.setAttrByPath path (lib.getAttrFromPath path source);
in
rec {
    # package => revision => source => ( final => prev => {} )
    # creates an overlay that pins <package> from <source> to <revision>
    # example: mkOverlayFromSource "ytmdesktop" "d179d77c139e0a3f5c416477f7747e9d6b7ec315" "github:NixOS/nixpkgs"
    mkOverlayFromSource =
        package: revision: source:
        (
            final: prev:
            let
                # construct pinned pkgs
                src = builtins.getFlake "${source}?rev=${revision}";
                pinned = import src {
                    inherit system;
                    overlays = [ ];
                    config = prev.config or { allowUnfree = true; };
                };

                path = lib.splitString "." package; # list of path segments

                existing = copyAttrByPath (lib.init path) prev;
                updated = copyAttrByPath path pinned;
            in
            lib.recursiveUpdate existing updated
        );

    # package => revision => (final => prev => {})
    # creates an overlay that pins <package> from NixOS/nixpkgs to <revision>
    # example: mkOverlay "ytmdesktop" "d179d77c139e0a3f5c416477f7747e9d6b7ec315"
    mkOverlay = package: revision: mkOverlayFromSource package revision "github:NixOS/nixpkgs";

    # args@{package=revision} => [(final => prev => {})]
    # creates a list of overlays that pins each package from <args> to a specific revision
    # example: mkOverlays { ytmdesktop = "d179d77c139e0a3f5c416477f7747e9d6b7ec315"; }
    mkOverlays = args@{ ... }: lib.mapAttrsToList mkOverlay args;
}
