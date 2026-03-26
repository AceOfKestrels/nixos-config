{ pkgs, ... }:

{
    # Aktiviert den OpenSSH Daemon
    services.openssh = {
        enable = true;

        settings = {
            PasswordAuthentication = true;
            PermitRootLogin = "no";
            X11Forwarding = true;
        };
    };
    networking.firewall.allowedTCPPorts = [ 22 ];

    environment.systemPackages = with pkgs; [
        xauth
    ];
}
