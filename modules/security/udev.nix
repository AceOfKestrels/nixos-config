{ ... }:
{
    services.udev.extraRules = ''
        # Keychron devices
        KERNEL=="hidraw*", SUBSYSTEM=="hidraw", ATTRS{idVendor}=="3434", MODE="0666"

        # STM32 DFU bootloader used by keychron
        SUBSYSTEM=="usb", ATTR{idVendor}=="0483", ATTR{idProduct}=="df11", MODE="0666", TAG+="uaccess"
    '';
}
