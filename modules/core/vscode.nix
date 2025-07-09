{ pkgs, ... }:

{
    environment.systemPackages = with pkgs; [
        vscode
        nixfmt-rfc-style
        nixd
    ];
}
