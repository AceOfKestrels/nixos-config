{ ... }:

{
    programs.kitty = {
        enable = true;
        extraConfig = builtins.readFile ./kitty.annika.conf;
        shellIntegration.enableZshIntegration = false;
    };
}
