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
        jetbrains = "8eaee110344796db060382e15d3af0a9fc396e0e";
    };
}
