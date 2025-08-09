{ ... }:
{
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
        whitelist \$HOME/.local/share/tor-browser
        mkdir \$HOME/.local/share/tor-browser
    '';
}
