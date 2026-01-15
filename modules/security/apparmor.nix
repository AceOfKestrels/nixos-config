{ pkgs, ... }:

{
    # if somthing is blockt it will be in journalctl -xe
    security.apparmor = {
        enable = true;

        packages = [ pkgs.apparmor-profiles ];

        killUnconfinedConfinables = true;

        enableCache = true;
    };

    services.dbus.apparmor = "enabled";

    environment.systemPackages = with pkgs; [
        apparmor-utils # provides aa-status, aa-complain, etc.
        apparmor-bin-utils
    ];
}
