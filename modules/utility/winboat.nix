{ pkgs, ... }:

{
    # IMPORTANT User Podman !!!
    imports = [
        ../../standard/tools/docker.nix
    ];

    environment.systemPackages = with pkgs; [
        winboat
    ];
}
