{ kestrix, ... }:

let
    standardModules = [
        ../standard/tools/docker.nix
        ../standard/tools/git.nix
        ../standard/tools/rsync.nix
        ../standard/tools/tools.nix
        ../standard/tools/vscode.nix

        ../standard/desktop/cosmic.nix

        ../standard/terminal/aliases.nix
        ../standard/terminal/kitty.nix
        ../standard/terminal/shell-sources.nix
        ../standard/terminal/zsh.nix

        ../standard/security/apparmor.nix
        ../standard/security/clamav.nix
        ../standard/security/firewall.nix
        ../standard/security/sudo.nix
        ../standard/security/polkit.nix

        ../standard/system/audio.nix
        ../standard/system/env.nix
        ../standard/system/kernel.nix
        ../standard/system/zram.nix

        ../standard/nix/garbage-collect.nix
        ../standard/nix/lix.nix
        ../standard/nix/nh.nix
    ];

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
    ];
    annikaSystemModules = [
    ];

    kesHmModules = [
        ../modules/utility/librewolf.home.nix
        ../modules/utility/nvim.home.nix
        ../modules/utility/drawing.home.nix
        ../modules/utility/env.kes.home.nix
    ];
    kesSystemModules = [
        ../modules/utility/librewolf.nix
    ];

    melHmModules = [ ];
    melSystemModules = [ ];
in
{
    imports =
        standardModules
        ++ kestrix.tagged {
            notebook = [ ./tags.notebook.nix ];
            pc = [ ./tags.pc.nix ];
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
