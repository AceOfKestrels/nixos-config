{ ... }:

{
    programs.kitty = {
        enable = true;
        extraConfig = builtins.readFile ./kitty.kes.conf;
        shellIntegration.enableZshIntegration = false; # incompatible with sudo-rs
    };
}
