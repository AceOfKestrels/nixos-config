{ pkgs, ... }:

{
    environment.systemPackages = with pkgs; [
        vscode
        nixfmt-rfc-style
        nixd
    ];

    imports = [ ../home-manager.nix ];
    home-manager.sharedModules = [ ./vscode.home.nix ];
}
