# nixos-config/live-boot/scripts

Helper scripts to create a live-boot iso and write it to a usb drive

## Usage

1. `create-iso.sh [config-name] [output-dir]`
    - 1st argument is the config to use (defaults to "live-boot", no pre-set configuration)
    - 2nd argument is the directory to create the iso in (defaults to the scripts directory)
    - This will create the iso and write it to the output path
2. `find-usb.sh`
    - Outputs a list of all connected usb drives
3. `write-iso.sh <iso-path> <usb-path>`
    - 1st argument is an iso file
    - 2nd argument is the output of `find-usb.sh`
    - Writes the iso to the specified usb drive

## Adding your own config

When creating the iso, you can select a config to install with the final system. This must be a flake (such as a device config).

1. Make sure to create a user in your config and set the `initialPassword`, `hashedPassword` or `initialHashedPassword` field.
    - Otherwise you will be unable to log into your user account after installation is complete.
2. Copy one of the existing configurations and adjust the flake path and configuration name
