{ ... }:

{
    services.flatpak.repositories = {
        flathub = "https://dl.flathub.org/repo/flathub.flatpakrepo";
    };
    services.flatpak.packages = [
        "com.github.tchx84.Flatseal" # from default repo ("flatub", or first in list)

        {
            # install from a repo and/or a specific version
            name = "com.github.tchx84.Flatseal";
            repo = "flathub"; # optional
            version = "2.4.1"; # optional
        }

        {
            # install from download url, with optionally a sha256
            name = "com.github.tchx84.Flatseal";
            url = "https://my-package.flatpak";
            sha256 = "123456"; # optional
        }
    ];
}
