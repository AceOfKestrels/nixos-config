# nixos-config/live-boot/scripts

Helper scripts to create a live-boot iso and write it to a usb drive

## Usage

1. `create-iso.sh [output-dir]`
    - 1st argument is the directory to create the iso in (optional)
    - This will create the iso and write it to the output path
2. `find-usb.sh`
    - Outputs a list of all connected usb drives
3. `write-iso.sh <iso-path> <usb-path>`
    - 1st argument is an iso file
    - 2nd argument is the output of `find-usb.sh`
    - Writes the iso to the specified usb drive
