{ pkgs, ... }:

{
    imports = [
        ./terraform.nix
        ./kubernetes.overlay.nix
    ];

    environment.systemPackages = with pkgs; [
        packer
        kubectl
        coreutils
        freelens
    ];
}
