{
    lib,
    pkgs,
    ...
}:

{
    networking.networkmanager.enable = true;
    services.printing.enable = true;

    services.xserver.enable = true;

    boot.loader.systemd-boot.enable = true;
    boot.loader.efi.canTouchEfiVariables = true;

    security.sudo.enable = true;

    imports = [
        ./development/docker.nix
        ./development/dotnet.nix
        ./development/webdev.nix
        ./utility/wireguard.nix

        ./security/udev.nix

        ./bootloader/grub.nix

        ./utility/audio.nix

        ./terminal/tmux.nix

        ./home-manager/catppuccin.nix
    ];

    programs.git.config = {
        user = {
            name = lib.mkForce "AceOfKestrels";
            email = lib.mkForce "aceofkestrels@gmail.com";
        };
        core.editor = lib.mkForce "nvim";
    };

    environment.shellAliases = {
        edit-shell-sources = ''code "$SHELL_SOURCES_DIR"'';
        code = "codium";
    };

    environment.systemPackages = with pkgs; [
        krita
        kitty
    ];
    time.timeZone = "Europe/Berlin";

    i18n.defaultLocale = "en_GB.UTF-8";

    i18n.supportedLocales = [
        "en_GB.UTF-8/UTF-8"
        "en_US.UTF-8/UTF-8"
        "de_DE.UTF-8/UTF-8"
    ];

    i18n.extraLocaleSettings = {
        LC_ADDRESS = "de_DE.UTF-8";
        LC_IDENTIFICATION = "de_DE.UTF-8";
        LC_MEASUREMENT = "de_DE.UTF-8";
        LC_MONETARY = "de_DE.UTF-8";
        LC_NAME = "de_DE.UTF-8";
        LC_NUMERIC = "de_DE.UTF-8";
        LC_PAPER = "de_DE.UTF-8";
        LC_TELEPHONE = "de_DE.UTF-8";
        LC_TIME = "de_DE.UTF-8";
    };

    services.xserver.xkb = {
        layout = "de";
        variant = "";
    };

    console.keyMap = "de";
}
