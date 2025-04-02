# NixOS Configs

These are the configurations I use for my NixOS installations. Very much WIP.

## Installation
Clone the repository. Recommended directories: 
- /home/<user>/
- /etc/nixos/

Import the modules you want to use in your `configuration.nix`. I have already created device configs for all the machines I run NixOS on.

## Contribution
Feel free to contribute by forking the repository and creating a pull request. However, I will usually not accept them as-is and may implement some of your additions myself in a different way.

### Style Guide
Follow the existing repository structure. If you create a new module that could be grouped together with existing ones, consider moving them into a subfolder.

Every module must be independent and self-contained. That means every module can be imported and just work. Dependencies on other modules need to be added to the imports.
