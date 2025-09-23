{ kestrel, ... }:

kestrel.mkHome {
    catppuccin = {
        enable = true;
        flavor = "mocha";
        accent = "blue";

        vscode.profiles.default.settings = {
            workbenchMode = "default";
            extraBordersEnabled = true;
            colorOverrides = {
                mocha = {
                    base = "#11111b";
                    crust = "#1e1e2e";
                };
            };
        };
    };
}
