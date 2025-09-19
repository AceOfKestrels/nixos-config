{ kestrel, ... }:

kestrel.mkHome {
    dconf.settings."org/gnome/calculator" = {
        accuracy = 9;
        angle-units = "degrees";
        base = 10;
        button-mode = "basic";
        number-format = "automatic";
        show-thousands = false;
        show-zeroes = false;
        window-maximized = false;
        window-size = "(360, 626)";
        word-size = 64;
    };
}
