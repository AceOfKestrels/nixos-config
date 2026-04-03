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
in
{
    imports =
        standardModules
        ++ kestrix.tagged {
            notebook = [ ./tags.notebook.nix ];
            pc = [ ./tags.pc.nix ];
        };
}
