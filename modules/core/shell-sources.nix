{ config, pkgs, ... }:

{
    environment = {
        variables = {
            SHELL_SOURCES_DIR = "$HOME/shell-sources";
            SHELL_SOURCES_SOURCE_ALL_FILE = "source-all";
            SHELL_SOURCES_REMOTE = "https://github.com/AceOfKestrels/shell-sources.git";
            SHELL_SOURCES_REMOTE_BRANCH = "origin/main";
        };

        shellInit = builtins.readFile ../../scripts/shell/shell-sources.sh;
    };

    programs.git.enable = true;
}
