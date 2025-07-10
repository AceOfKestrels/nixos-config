{ pkgs, ... }:

{
    programs.vscode = {
        enable = true;
        package = pkgs.vscode;

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
    };
}
