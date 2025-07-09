{ pkgs, ... }:

{
    environment.systemPackages = with pkgs; [
        jetbrains.rider

        dotnetCorePackages.dotnet_8.sdk # .NET 8
    ];
}
