{ pkgs, ... }:

{
    home.packages = with pkgs; [
        (dotnetCorePackages.combinePackages [
            dotnetCorePackages.sdk_8_0
            dotnetCorePackages.sdk_9_0
            dotnetCorePackages.sdk_10_0
        ])
    ];
}
