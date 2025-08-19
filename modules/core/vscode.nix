{ pkgs, ... }:

{
    environment.systemPackages = with pkgs; [
        nixfmt-rfc-style
        nixd
    ];

    imports = [ ../home-manager.nix ];
    home-manager.sharedModules = [ ./vscode.home.nix ];
}
