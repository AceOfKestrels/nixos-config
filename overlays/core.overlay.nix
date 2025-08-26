{ ... }:

let
    # Pin info
    nixpkgs-revision = "9807714d6944a957c2e036f84b0ff8caf9930bc0";
    nixpkgs-sha256 = "1g9qc3n5zx16h129dqs5ixfrsff0dsws9lixfja94r208fq9219g";

    pinnedSrc = builtins.fetchTarball {
        url = "https://github.com/NixOS/nixpkgs/archive/${nixpkgs-revision}.tar.gz";
        sha256 = nixpkgs-sha256;
    };
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

    environment.shellAliases = {
        prefetch-current-build = ''
            rev=$(nixos-version --revision); echo "revision: $rev";
                    sha=$(nix-prefetch-url --unpack "https://github.com/NixOS/nixpkgs/archive/$rev.tar.gz" --print-path);
                    echo "sha256: $sha" | head -n1'';
    };
}
