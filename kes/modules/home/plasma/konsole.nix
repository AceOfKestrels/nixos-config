{ pkgs, ... }:
let
    profileName = "kes-term";
in
{
    programs.konsole.enable = true;
    programs.konsole.defaultProfile = profileName;
    programs.konsole.profiles.${profileName} = {
        colorScheme = "Breeze";
        font.name = "MesloLGS Nerd Font";
    };

    fonts.fontconfig.enable = true;
    home.packages = with pkgs.nerd-fonts; [
        meslo-lg
    ];
}
