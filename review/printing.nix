{ kestrel, ... }:

{
    imports = kestrel.userModules {
        annika = ./printing.annika.nix;
    };
    # Enable CUPS to print documents.
    services.printing.enable = true;
}
