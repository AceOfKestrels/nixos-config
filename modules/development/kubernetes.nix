{ pkgs, ... }:

{
    imports = [
        ./terraform.nix
    ];

    environment.systemPackages = with pkgs; [
        packer
        kubectl
        coreutils
        freelens
    ];
}
