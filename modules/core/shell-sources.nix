{
    lib,
    pkgs,
    ...
}:

let
    # Base variables
    rawPath = "$HOME/shell-sources";
    remoteUrl = "https://github.com/AceOfKestrels/shell-sources.git";

    # Variable for autoupdate
    unitPath = lib.replaceStrings [ "$HOME" ] [ "%h" ] rawPath; # systemd services do not expand $HOME, but can use %h instead

    # Util script
    shell-sources-script = {
        text = builtins.readFile ../../scripts/shell/shell-sources.sh;
        mode = "0755";
    };
in
{
    programs.git.enable = true;

    # Source shell scripts and update utils in shell init
    environment = {
        etc."profile.d/shell-sources.sh" = shell-sources-script;

        variables = {
            SHELL_SOURCES_DIR = rawPath;
            SHELL_SOURCES_REMOTE = remoteUrl;
            SHELL_SOURCES_SOURCE_ALL_FILE = "source-all.sh";

            GIT_BROWSER = "firefox-devedition"; # Used in one of the commands
        };

        shellInit = ''
            . /etc/profile.d/shell-sources.sh
        '';
    };

    # Autoupdate service
    systemd.user.services.shell-sources-autoupdate = {
        description = "Update shell sources on boot";

        path = [
            pkgs.git
            pkgs.bash
        ];

        script = builtins.readFile ../../scripts/shell/autoupdate-shell-sources.sh;

        serviceConfig = {
            Type = "oneshot";
            RemainAfterExit = false;
            Environment = [
                "SHELL_SOURCES_DIR=${unitPath}"
                "SHELL_SOURCES_REMOTE=${remoteUrl}"
            ];

            StandardOutput = "journal";
            StandardError = "journal";
        };
    };

    # Timer for autoupdate service to run after every boot
    systemd.user.timers.shell-sources-autoupdate = {
        description = "Update shell sources on boot";
        enable = true;
        wantedBy = [ "timers.target" ];

        timerConfig = {
            OnBootSec = "1min"; # wait for network
            Unit = "shell-sources-autoupdate.service";
        };
    };
}
