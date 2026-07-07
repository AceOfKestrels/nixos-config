{ pkgs, ... }:

{
    services.printing = {
        enable = true;
        browsed.enable = false;
        browsing = false;
        extraConf = ''
            BrowseProtocols none
            BrowseLocalProtocols none
        '';

        drivers = [ pkgs.gutenprint ];
    };

    hardware.printers = {
        ensurePrinters = [
            {
                name = "Kyocera_MA2100cfx";
                location = "Home";
                deviceUri = "ipp://10.100.50.2/ipp/print";
                model = "everywhere";
                ppdOptions = {
                    PageSize = "A4";
                };
            }
        ];
        ensureDefaultPrinter = "Kyocera_MA2100cfx";
    };
}
