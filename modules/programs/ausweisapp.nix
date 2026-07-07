{ pkgs, ... }:

{
    environment.systemPackages = with pkgs; [
        ausweisapp
    ];

    networking.firewall = {
        allowedUDPPorts = [ 24727 ]; # For device discovery
        allowedTCPPorts = [ 24727 ]; # For data transfer
    };
}
