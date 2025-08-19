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

### Import

This config only supports flake-based systems. Simply choose a device flake and use it for rebuilding:

```sh
sudo nixos-rebuild --flake <path_to_flake>
```

## Style Guide

Follow the existing repository structure. If you create a new module that could be grouped together with existing ones, consider moving them into a subfolder.

Every module must be independent, self-contained. Every module must be able to be imported and just work. Dependencies on other modules need to be added to the imports.

Config files that aren't user specific (e.g. under `kes/`, `annika/`, etc.) should not use `lib.mkForce` if possible.

Nix files are linted using `nixfmt` with indentation set to 4 spaces.
