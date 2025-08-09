{ pkgs, ... }:
let
    profileName = "kes-term";
in
{
    programs.konsole = {
        enable = true;
        defaultProfile = profileName;

        customColorSchemes = {
            "Catpuccin Frappe" = ./themes/catppuccin-frappe.colorscheme;
            "Catpuccin Latte" = ./themes/catppuccin-latte.colorscheme;
            "Catpuccin Macciato" = ./themes/catppuccin-macchiato.colorscheme;
            "Catpuccin Mocha" = ./themes/catppuccin-mocha.colorscheme;
        };

        profiles.${profileName} = {
            colorScheme = "Catpuccin Mocha";
            font.name = "MesloLGS Nerd Font";
        };
    };

    fonts.fontconfig.enable = true;
    home.packages = with pkgs.nerd-fonts; [
        meslo-lg
    ];
}
