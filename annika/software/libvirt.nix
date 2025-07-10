{ ... }:

{
    programs.virt-manager.enable = true;

    users.groups.libvirtd.members = [ "annika" ];

    virtualisation.libvirtd.enable = true;

    virtualisation.spiceUSBRedirection.enable = true;
}
