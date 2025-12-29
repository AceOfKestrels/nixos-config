{ ... }:

{
    imports = [
        ./libvirt.nix
    ];

    programs.virt-manager.enable = true;

}
