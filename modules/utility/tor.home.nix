# modules/tor-browser.hm.nix
{
    config,
    lib,
    pkgs,
    ...
}:

let
    cfg = config.my.torBrowser;
in
with lib;
{
    options.my.torBrowser.enable = mkEnableOption "Tor Browser via Firejail (Home Manager)";

    config = mkIf cfg.enable {
        # User-scoped packages
        home.packages = [
            pkgs.tor-browser
            pkgs.firejail
        ];

        # Your Firejail profile (from tor.home.nix)
        xdg.configFile."firejail/torbrowser.profile".text = ''
            include /etc/firejail/disable-common.inc
            include /etc/firejail/disable-programs.inc
            include /etc/firejail/whitelist-common.inc

            # Borrow Firefox rules if present (usually is on NixOS)
            include /etc/firejail/firefox.profile

            # Extra hardening (tune to taste)
            private-tmp
            private-cache
            nogroups
            netfilter

            # Optional: persist Tor Browser data in a single folder
            whitelist $HOME/.local/share/tor-browser
            mkdir $HOME/.local/share/tor-browser
        '';

        # User wrapper that enforces Firejail profile
        home.file.".local/bin/tor-browser" = {
            text = ''
                #!${pkgs.bash}/bin/bash
                exec ${pkgs.firejail}/bin/firejail \
                  --profile="${config.xdg.configHome}/firejail/torbrowser.profile" \
                  ${pkgs.tor-browser}/bin/tor-browser "$@"
            '';
            executable = true;
        };

        # Desktop entry that points to the wrapper
        xdg.desktopEntries.tor-browser = {
            name = "Tor Browser (Firejail)";
            comment = "Browse with Tor using a Firejail sandbox";
            exec = "${config.home.homeDirectory}/.local/bin/tor-browser %U";
            terminal = false;
            categories = [
                "Network"
                "WebBrowser"
            ];
            mimeType = [
                "text/html"
                "x-scheme-handler/http"
                "x-scheme-handler/https"
            ];
        };
    };
}
