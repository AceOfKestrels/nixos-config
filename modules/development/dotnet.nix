{ kestrel, pkgs, ... }:

{
    environment.systemPackages = with pkgs; [
        jetbrains.rider

        dotnetCorePackages.dotnet_8.sdk # .NET 8
        dotnetCorePackages.dotnet_9.sdk # .NET 9
    ];

    nixpkgs.overlays = kestrel.overlays.mkOverlays {
        jetbrains = "8eaee110344796db060382e15d3af0a9fc396e0e";
    };
}
