{ pkgs, ... }:

{
    home.packages = with pkgs; [
        (dotnetCorePackages.combinePackages [
            dotnetCorePackages.sdk_10_0
        ])
    ];
}
