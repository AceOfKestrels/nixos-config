{
    lib,
    ...
}:

{
    nixpkgs.config.allowUnfree = true;
    nix.settings.experimental-features = [
        "nix-command"
        "flakes"
    ];

    networking.networkmanager.enable = true;
    services.printing.enable = true;

    services.xserver.enable = true;

    boot.loader.systemd-boot.enable = true;
    boot.loader.efi.canTouchEfiVariables = true;

    security.sudo.enable = true;

    imports = [
        ../../modules/desktop/kde-plasma.nix

        ../../modules/core.nix

        ../../modules/development/docker.nix
        ../../modules/development/dotnet.nix
        ../../modules/development/webdev.nix
        ../../modules/development/wireguard.nix

        ./core/locale.nix
        ./core/pipewire.nix

        ./kes-home.nix
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
    };
}
