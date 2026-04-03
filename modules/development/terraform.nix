{ pkgs, ... }:

{
    environment.systemPackages = with pkgs; [
        terraform
        packer
        hcloud
        coreutils
    ];
}
