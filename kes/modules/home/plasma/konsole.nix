{
    pkgs,
    lib,
    osConfig,
    ...
}:

let
    defaultProfile = "kes-tmux";
    altProfile = "kes-zsh";

    hasInstalled = pkg: lib.any (p: p.drvPath == pkg.drvPath) osConfig.environment.systemPackages;
in
{
    assertions = [
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

        profiles.${altProfile}.extraConfig = {
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
