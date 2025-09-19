{ pkgs, ... }:

{
    environment.systemPackages = with pkgs; [
        nixfmt-rfc-style
        nixd
    ];

    home-manager.sharedModules = [ ./vscode.home.nix ];
}
