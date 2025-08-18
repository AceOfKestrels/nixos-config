{ pkgs, ... }:
{
    programs.firejail = {
        enable = true;

        wrappedBinaries.tor-browser = {
            executable = "${pkgs.tor-browser-bundle-bin}/bin/tor-browser";
        };
    };

    home-manager.sharedModules = [
        ./tor.home.nix
    ];

    environment.systemPackages = [
        pkgs.tor-browser-bundle-bin
    ];
}
