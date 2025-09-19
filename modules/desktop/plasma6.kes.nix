{ kestrel, ... }:

{
    imports = [
        ./plasma6.nix
    ];
}
// kestrel.mkHome {
    imports = [
        ./kes/plasma/konsole.home.nix
        ./kes/plasma/theme.home.nix
    ];
}
