{ pkgs, ... }:

{
    environment.systemPackages = with pkgs; [
        jetbrains.rider

        dotnetCorePackages.dotnet_8.sdk # .NET 8
        dotnetCorePackages.dotnet_9.sdk # .NET 9
    ];
}
