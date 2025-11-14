{ pkgs, ... }:

{
    # Include core packages
    environment.systemPackages = with pkgs; [
        onlyoffice-desktopeditors
        gimp3
        inkscape
        pkgsStable.pdfsam-basic
    ];

    # How to make onlyoffice detect fonts?
    fonts = {
        enableDefaultPackages = true;
        packages = with pkgs; [
            # nerdfonts
            winePackages.fonts
            noto-fonts
            noto-fonts-cjk-sans
            noto-fonts-color-emoji
            liberation_ttf
            fira-code
            fira-code-symbols
            mplus-outline-fonts.githubRelease
            dina-font
            proggyfonts
        ];
    };
}
