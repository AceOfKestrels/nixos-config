{
    pkgs,
    lib,
    ...
}:

{
    # to use this add "clamav" group to you user
    environment.systemPackages = with pkgs; [
        clamav
    ];

    services.clamav = {
        daemon.enable = true;

        clamonacc = {
            enable = true;
        };

        daemon.settings = {
            OnAccessIncludePath = [
                "/home/annika/Downloads"
                "/home/kes/Downloads"
            ];

            OnAccessPrevention = true;

            MaxScanSize = "100M";

            User = lib.mkForce "root";
        };

        updater = {
            enable = true;
            interval = "hourly";
        };
    };

    systemd.services.clamav-clamonacc = {
        serviceConfig = {
            Restart = "on-failure";
            RestartSec = "5s";
            StartLimitIntervalSec = 0;
        };
        after = [ "clamav-daemon.service" ];
        requires = [ "clamav-daemon.service" ];
    };

}
