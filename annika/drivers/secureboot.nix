{ pkgs, ... }:
{
    environment.systemPackages = with pkgs; [
        sbsigntool
        efitools
        efivar
        mokutil
        openssl
        file
    ];
    boot.loader.efi.canTouchEfiVariables = true;

    system.activationScripts.securebootSign.text = ''
        set -euo pipefail

        KEY=/root/secureboot/keys/DB.key
        CRT=/root/secureboot/keys/DB.crt
        SBSIGN=${pkgs.sbsigntool}/bin/sbsign
        FILE=${pkgs.file}/bin/file

        sign_always() {
          local f="$1"
          [ -f "$f" ] || return 0

          # only touch valid EFI binaries
          if ! $FILE -b "$f" | grep -q 'PE32'; then
            echo "skip (not PE/COFF): $f"
            return 0
          fi

          local tmp="$(dirname "$f")/.signed-$(basename "$f")"
          $SBSIGN --key "$KEY" --cert "$CRT" --output "$tmp" "$f"
          mv -f "$tmp" "$f"
          echo "re-signed: $f"
        }

        for dir in \
          /boot/EFI/nixos \
          /boot/EFI/NixOS-boot \
          /boot/EFI/EFI/NixOS-boot-efi \
          /boot/EFI/systemd \
          /boot/EFI/BOOT
        do
          [ -d "$dir" ] || continue
          for f in "$dir"/*.efi; do
            [ -e "$f" ] || continue
            sign_always "$f"
          done
        done
    '';

    system.activationScripts.grubSecureBoot.text = ''
        set -euo pipefail
        KEY=/root/secureboot/keys/DB.key
        CRT=/root/secureboot/keys/DB.crt
        GRUBMK=${pkgs.grub2}/bin/grub-mkstandalone
        SBSIGN=${pkgs.sbsigntool}/bin/sbsign
        SBVERIFY=${pkgs.sbsigntool}/bin/sbverify
        FILE=${pkgs.file}/bin/file

        ESP=/boot/EFI
        CFG=/boot/grub/grub.cfg
        OUT="$ESP/nixos/grubx64.efi"

        # Build monolithic GRUB
        $GRUBMK -O x86_64-efi -o "$OUT" "boot/grub/grub.cfg=$CFG" \
          --modules="normal linux efi_gop efi_uga gfxterm gzio part_gpt fat ext2 search search_fs_uuid search_fs_file loadenv configfile"

        # Sign and verify
        $SBSIGN --key "$KEY" --cert "$CRT" --output "$OUT" "$OUT"
        $SBVERIFY --list "$OUT" >/dev/null
    '';
}
