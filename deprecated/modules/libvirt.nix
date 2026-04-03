{ ... }:

{
    virtualisation.libvirtd.enable = true;

    virtualisation.libvirtd.qemu = {
        runAsRoot = true;
        swtpm.enable = true;
    };

    virtualisation.spiceUSBRedirection.enable = true;
}
