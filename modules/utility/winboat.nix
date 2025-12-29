{ pkgs, ... }:

{
    # IMPORTANT User Podman !!!
    imports = [
        ./libvirt.nix
        ../development/docker.nix
    ];

    environment.systemPackages = with pkgs; [
        winboat
    ];
}
