{ kestrix, ... }:

let
    standard = [
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

    shared = [
        ../modules/gaming/minecraft.home.nix
        ../modules/development/dotnet.home.nix
        ../modules/development/webdev.home.nix
        ../modules/programs/jellyfin.home.nix
        ../modules/programs/tidal.home.nix
        ../modules/programs/discord.home.nix

        ../modules/gaming/steam.nix
        ../modules/utility/printing.nix
        ../modules/programs/tor.nix
        ../modules/utility/locale-en.nix
        ../modules/utility/catppuccin.nix
    ];

    annika = [
        ../modules/programs/termius.home.nix
        ../modules/programs/chrome.home.nix
    ];

    kes = [
        ../modules/programs/librewolf.home.nix
        ../modules/programs/nvim.home.nix
        ../modules/programs/drawing.home.nix
        ../modules/utility/env.kes.home.nix

        ../modules/programs/librewolf.nix
    ];

    mel = [ ];
in
{
    imports =
        standard
        ++ kestrix.tagged {
            notebook = [ ./tags.notebook.nix ];
            pc = [ ./tags.pc.nix ];
            kes = kes ++ shared;
            annika = annika ++ shared;
            mel = mel;
        };
}
