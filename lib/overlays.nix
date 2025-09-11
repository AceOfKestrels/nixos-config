{ system, ... }:

rec {
    mkPinned = package: revision: mkPinnedFromSource package revision "github:NixOS/nixpkgs";

    mkPinnedFromSource =
        package: revision: source:
        (
            final: prev:
            let
                src = builtins.getFlake "${source}?rev=${revision}";
                pinned = import src {
                    inherit system;
                    config = {
                        allowUnfree = true;
                    };
                };
            in
            {
                ${package} = pinned.${package};
            }
        );
}
