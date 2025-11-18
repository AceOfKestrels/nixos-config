{ kestrel, pkgs, ... }:

{
    environment.systemPackages = with pkgs; [
        jetbrains.rider

        yaak

        (dotnetCorePackages.combinePackages [
            dotnetCorePackages.sdk_8_0
            dotnetCorePackages.sdk_9_0
            dotnetCorePackages.sdk_10_0
        ])
    ];

    nixpkgs.overlays = kestrel.overlays.mkOverlays {
        jetbrains = "c5ae371f1a6a7fd27823bc500d9390b38c05fa55";
    };
}
