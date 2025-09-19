{ kestrel, pkgs, ... }:

{
    environment.systemPackages = with pkgs; [
        nixfmt-rfc-style
        nixd
    ];

    home-manager.sharedModules = [ ./vscode.home.nix ];
}
// kestrel.mkHome {
    programs.vscode = {
        enable = true;

        # HM only adds new extensions to allow manual installation
        # If you remove any here they need to be uninstalled manually
        profiles.default.extensions = with pkgs.vscode-extensions; [
            jnoortheen.nix-ide
            timonwong.shellcheck
            github.vscode-github-actions
            christian-kohler.path-intellisense
            davidanson.vscode-markdownlint
            ms-azuretools.vscode-docker
            ms-vsliveshare.vsliveshare
        ];

        profiles.default.userSettings = {
            "terminal.integrated.fontFamily" = "MesloLGS Nerd Font";
        };
    };

    fonts.fontconfig.enable = true;
    home.packages = with pkgs.nerd-fonts; [
        meslo-lg
    ];
}
