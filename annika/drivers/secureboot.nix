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
        FILEBIN=${pkgs.file}/bin/file

        sign_if_efi() {
          local f="$1"
          [ -f "$f" ] || return 0

          # Only sign PE/COFF (both PE32 and PE32+)
          if ! "$FILEBIN" -b "$f" | grep -Eq 'PE32(\+)?'; then
            echo "skip (not PE/COFF): $f"
            return 0
          fi

          local tmp="$(dirname "$f")/.signed-$(basename "$f")"
          "$SBSIGN" --key "$KEY" --cert "$CRT" --output "$tmp" "$f"
          mv -f "$tmp" "$f"
          echo "re-signed: $f"
        }

        for dir in \
          /boot/EFI/Linux \               # UKIs (the actual boot target)
          /boot/EFI/systemd \
          /boot/EFI/nixos \
          /boot/EFI/NixOS-boot \
          /boot/EFI/BOOT
        do
          [ -d "$dir" ] || continue
          for f in "$dir"/*.efi; do
            [ -e "$f" ] || continue
            sign_if_efi "$f"
          done
        done
    '';
}
