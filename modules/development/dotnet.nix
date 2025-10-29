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

    #nixpkgs.overlays = kestrel.overlays.mkOverlays {
    #    jetbrains = "1666250dbe4141e4ca8aaf89b40a3a51c2e36144";
    #};
}
