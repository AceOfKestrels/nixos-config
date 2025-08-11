{
    pkgs,
    lib,
    osConfig,
    ...
}:

let
    defaultProfile = "kes-tmux";
    altProfile = "kes-zsh";

    profilesBase = {
        Appearance = {
            ColorScheme = "Catppuccin";
            Font = "MesloLGS Nerd Font,10";
            BoldIntense = false;
            UseFontLineCharacters = true;
        };
        "Cursor Options" = {
            CursorShape = 1;
        };
        General = {
            LocalTabTitleFormat = "%# %d : %n";
            RemoteTabTitleFormat = "%# (%u) %H";
            SemanticInputClick = true;
        };
        "Interaction Options" = {
            MiddleClickPasteMode = 1;
            OpenLinksByDirectClickEnabled = true;
            UnderlineFilesEnabled = true;
        };
        Scrolling = {
            HistoryMode = 1;
            HistorySize = 10000;
        };
    };

    hasInstalled = pkg: lib.any (p: p.drvPath == pkg.drvPath) osConfig.environment.systemPackages;
in
{
    assertions = [
        {
            assertion = hasInstalled pkgs.tmux;
            message = "Expected tmux to be installed system-wide";
        }
        {
            assertion = hasInstalled pkgs.zsh;
            message = "Expected zsh to be installed system-wide";
        }
    ];

    programs.konsole = {
        enable = true;
        defaultProfile = "${defaultProfile}";

        customColorSchemes = {
            "Catppuccin" = ./assets/catppuccin-customized.colorscheme;
        };

        profiles.${defaultProfile}.extraConfig = profilesBase // {
            General = {
                Command = "/run/current-system/sw/bin/bash -c 'SESSION=\"konsole_tab_$KONSOLE_DBUS_SESSION\"; tmux new-session -A -s \"$SESSION\"'";
            };
        };
        profiles.${altProfile}.extraConfig = profilesBase // {
            General = {
                Command = "/run/current-system/sw/bin/zsh";
            };
        };
    };

    fonts.fontconfig.enable = true;
    home.packages = with pkgs.nerd-fonts; [
        meslo-lg
    ];
}
