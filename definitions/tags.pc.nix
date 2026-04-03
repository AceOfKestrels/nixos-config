{ kestrix, ... }:

let
    sharedHmModules = [
        ../modules/gaming/minecraft.home.nix
        ../modules/development/dotnet.home.nix
        ../modules/development/webdev.home.nix
        ../modules/utility/jellyfin.home.nix
        ../modules/utility/tidal.home.nix
        ../modules/utility/discord.home.nix
    ];
    sharedSystemModules = [
        ../modules/gaming/steam.nix
        ../modules/utility/printing.nix
        ../modules/utility/tor.nix
        ../modules/utility/locale-en.nix
        ../modules/utility/catppuccin.nix
    ];

    annikaHmModules = [
        ../modules/utility/termius.home.nix
        ../modules/utility/chrome.home.nix
        ../modules/development/php.home.nix
    ];
    annikaSystemModules = [
        ../modules/development/terraform.nix
    ];

    kesHmModules = [
        ../modules/utility/librewolf.home.nix
        ../modules/utility/nvim.home.nix
        ../modules/utility/drawing.home.nix
        ../modules/utility/env.kes.home.nix
    ];
    kesSystemModules = [ ];

    melHmModules = [ ];
    melSystemModules = [ ];
in
{
    imports =
        kestrix.taggedForUser {
            kes = sharedHmModules ++ kesHmModules;
            annika = sharedHmModules ++ annikaHmModules;
            mel = melHmModules;
        }
        ++ kestrix.tagged {
            kes = sharedSystemModules ++ annikaSystemModules;
            annika = sharedSystemModules ++ kesSystemModules;
            mel = melSystemModules;
        };
}
