{ system, lib, ... }:

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
                pinnedValue = lib.getAttrFromPath path pinned;
                parent = lib.init path; # path to our package's parent

                # keep rest of tree
                left = if parent == [ ] then { } else lib.setAttrByPath parent (lib.getAttrFromPath parent prev);
                # set value of pinned package
                right = lib.setAttrByPath path pinnedValue;
            in
            lib.recursiveUpdate left right
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
