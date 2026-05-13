{ pkgs, ... }:

{
    home.packages = with pkgs; [
        chromium
        ungoogled-chromium
    ];
}
