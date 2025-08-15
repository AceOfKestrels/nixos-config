{ pkgs, ... }:
{
    nixpkgs.config.allowUnfree = true;

    programs.git.enable = true;
    programs.git.config.core.editor = "nano";
    programs.vscode.enable = true;
    programs.firefox.enable = true;

    environment.systemPackages = with pkgs; [
        fastfetch
        neovim
        htop
        openssh
        dig
        jq
    ];

    services.openssh.enable = true;
}
