{ ... }:

# This module is used to pin the version of packages to a specific nixpkgs revision
let
    # Set this to the nixpkgs commit hash and the archive hash you want to use
    # You can use the alias "prefetch-current-build" below to fetch them
    nixpkgs-revision = "9807714d6944a957c2e036f84b0ff8caf9930bc0";
    nixpkgs-sha256 = "1g9qc3n5zx16h129dqs5ixfrsff0dsws9lixfja94r208fq9219g";

    pinnedSrc = builtins.fetchTarball {
        url = "https://github.com/NixOS/nixpkgs/archive/${nixpkgs-revision}.tar.gz";
        sha256 = nixpkgs-sha256;
    };
    pinnedPkgs = import pinnedSrc {
        system = builtins.currentSystem;
        config = {
            allowUnfree = true;
        };
    };
in
{
    nixpkgs.overlays = [
        (self: super: {
            # Add packages to override like
            jetbrains.webstorm = pinnedPkgs.jetbrains.webstorm;
            jetbrains.rider = pinnedPkgs.jetbrains.rider;
        })
    ];

    environment.shellAliases = {
        prefetch-current-build = ''rev=$(nixos-version --revision); echo "revision: $rev"; sha=$(nix-prefetch-url --unpack "https://github.com/NixOS/nixpkgs/archive/$rev.tar.gz" --print-path); echo "sha256: $sha" | head -n1'';
    };
}
