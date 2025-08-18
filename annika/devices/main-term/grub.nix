{ ... }:
{
    imports = [
        ../../../modules/bootloader/grub.nix
    ];
    boot.loader.grub = {
        extraEntriesBeforeNixOS = false;

        # Custom GRUB entries go here
        extraEntries = ''
            menuentry "Windows Stuff" --class windows {
              insmod part_gpt
              insmod fat
              # Replace with your EFI System Partition UUID:
              search --fs-uuid --set=root FB6B-12D6
              chainloader /EFI/Microsoft/Boot/bootmgfw.efi
            }
        '';
    };

    # If needed:
    boot.loader.efi.efiSysMountPoint = "/boot/efi";
}
