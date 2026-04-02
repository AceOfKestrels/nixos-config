{ pkgs, ... }:

{
    environment.systemPackages = [ pkgs.librewolf ];

    programs.firefox = {
        enable = true;
        package = pkgs.librewolf;

        preferences = {
            # enable firefox sync
            "identity.fxaccounts.enabled" = true;

            "privacy.clearOnShutdown.cache" = false;
            "privacy.clearOnShutdown.downloads" = false;
            "privacy.clearOnShutdown.history" = false;
            "privacy.clearOnShutdown.cookies" = false;
            "privacy.clearOnShutdown.formdata" = true;

            "services.sync.prefs.sync.privacy.clearOnShutdown.cache" = false;
            "services.sync.prefs.sync.privacy.clearOnShutdown.downloads" = false;
            "services.sync.prefs.sync.privacy.clearOnShutdown.history" = false;
            "services.sync.prefs.sync.privacy.clearOnShutdown.cookies" = false;
            "services.sync.prefs.sync.privacy.clearOnShutdown.formdata" = true;

            "browser.sessionstore.resume_from_crash" = true;
            "browser.sessionstore.resuming_after_os_restart" = true;
            "browser.sessionstore.resume_session_once" = true;

            "privacy.resistFingerprinting" = false;
            "privacy.fingerprintingProtection" = false;
            "privacy.fingerprintingProtection.overrides" = "+AllTargets,-CSSPrefersColorScheme";
        };
    };
}
