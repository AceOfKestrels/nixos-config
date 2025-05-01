{ config, pkgs, ... }:

{
    imports = [
        ../../local/git.local.nix
    ];

    programs.git = {
        enable = true;

        config = {
            core = {
                editor = "nano";
            };
            init = {
                defaultBranch = "main";
            };
            credential = {
                helper = "manager";
                credentialStore = "cache";
            };
        };
    };

    environment.systemPackages = with pkgs; [
        git-credential-manager
    ];
}