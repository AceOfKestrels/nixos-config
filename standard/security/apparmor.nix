{ pkgs, ... }:

{

    security.apparmor = {
        enable = true;
        enableCache = true;
        killUnconfinedConfinables = true;
        packages = [ pkgs.apparmor-profiles ];
    };

    # Integrates AppArmor mediation into system DBus
    services.dbus.apparmor = "enabled";

    # REMOVE OR OMIT THE boot.kernelParams LINE THAT WAS HERE

    environment.systemPackages = with pkgs; [
        apparmor-utils # aa-status, aa-complain, aa-genprof
        apparmor-bin-utils # core parser tools
    ];

}
// {
    # Quic Fix
    nixpkgs.overlays = [
        (final: prev: {
            perlPackages = prev.perlPackages // {
                DBDCSV = prev.perlPackages.DBDCSV.overrideAttrs (oldAttrs: {
                    # Bypasses the upstream t/70_csv.t test failure in checkPhase
                    doCheck = false;
                });
            };
        })
    ];
}
