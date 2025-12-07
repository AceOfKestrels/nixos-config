# NixOS Config

Configurations I use for my NixOS installations.

## Installation

Decide where you want your configuration to live. This is usually `/etc/nixos/`

### Installation under `/etc/nixos/`

Since `/etc/` is owned by root, you have to make some preparations before clonig the repository here.

Create the directory first via:

```sh
sudo mkdir /etc/nixos/nixos-config -p
```

Change permissions recursively:

```sh
sudo chmod 777 /etc/nixos/nixos-config -R
```

Then clone the repository directly into there:

```sh
git clone https://github.com/AceOfKestrels/nixos-config.git /etc/nixos/nixos-config
```

### Rebuild

This config only supports flake-based systems. Simply choose a device flake and use it for rebuilding:

```sh
sudo nixos-rebuild --flake <path_to_flake>
```

You can run the `install.sh` script to list and rebuild available flakes in the repository.

## Style Guide

Follow the existing repository structure. If you create a new module that could be grouped together with existing ones, consider moving them into a subfolder.

Every module must be independent, self-contained. Every module must be able to be imported and just work. Dependencies on other modules need to be added to the imports.

Config files that aren't user specific (e.g. under `kes/`, `annika/`, etc.) should not use `lib.mkForce` if possible.

Nix files are linted using `nixfmt` with indentation set to 4 spaces.

## Secure Boot

NixOS does not provide signed kernels. Lanzaboote is a community project with the goal of enabling secure boot under NixOS.

After importing the `lanzaboote` module and rebuilding your system, a few additional steps are needed outside of Nix to set up and use Lanzaboote:

1. **Enroll Secure Boot keys**
   - Lanzaboote integrates with [`sbctl`](https://github.com/Foxboron/sbctl), which manages Secure Boot keys and signing.
   - Initialize and generate keys (if not already done by the module):

     ```sh
     sbctl status        # Check current Secure Boot state
     sbctl create-keys   # Generate new Secure Boot keys
     ```

   - Enroll the generated keys into your firmware:

     ```sh
     sbctl enroll-keys --microsoft # Installs keys into your firmware/UEFI with Microsoft Vendor Keys
     ```

   - You may need to enter your firmware (UEFI/BIOS) to confirm the enrollment.

2. **Verify key enrollment**
   - Check that Secure Boot is enabled and keys are in place:

     ```sh
     bootctl status
     sbctl status
     ```

   - `sbctl status` should show `Installed` for your keys.

3. **Sign additional binaries (if necessary)**
   - Lanzaboote automatically signs NixOS kernels and initrds.  
     If you have other EFI binaries or kernels you want to boot, sign them manually:

     ```sh
     sbctl sign -s /boot/EFI/BOOT/bootx64.efi
     ```

   - Verify what files are signed:

     ```sh
     sbctl verify
     ```

4. **Test the boot process**
   - Reboot your machine and confirm that:
     - Secure Boot is enabled.
     - The system boots with the Lanzaboote-signed kernel.
