{ ... }:

{
    dconf.settings."org/gnome/shell".favorite-apps = [ ];
    imports = [
        ./apps/calculator.home.nix
        ./apps/system-monitor.home.nix
        ./apps/nautilus.home.nix
    ];
}
