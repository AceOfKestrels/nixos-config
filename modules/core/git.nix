{ config, pkgs, ... }:

{
    imports = [
        ../../local/git.local.nix
    ];

    programs.git = {
        enable = true;

        config = {
            core.editor = "nano";
            alias = { 
                pfusch = "push --force";
            };
            init.defaultBranch = "main";
            credential.helper = "manager";
            credential.credentialStore = "secretservice";
            safe.directory = "/etc/nixos/nixos-config";
        };
    };

    environment.systemPackages = with pkgs; [
        git-credential-manager
    ];
}
