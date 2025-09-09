{ ... }:

let
    # Pin info
    revision = "9807714d6944a957c2e036f84b0ff8caf9930bc0";

    pinnedSrc = builtins.getFlake "github:NixOS/nixpkgs?rev=${revision}";
in
{
    nixpkgs.overlays = [
        (
            final: prev:
            let
                pinnedPkgs = import pinnedSrc {
                    system = prev.stdenv.hostPlatform.system; # ← flake-safe source of system
                    config = {
                        allowUnfree = true;
                    };
                };
            in
            {
                # Use packages from the pinned nixpkgs
                foobar = pinnedPkgs.foobar;
                termius = pinnedPkgs.termius;
            }
        )
    ];
}
