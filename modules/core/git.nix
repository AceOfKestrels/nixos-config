{ config, pkgs, ... }:

{
    programs.git = {
        enable = true;

        config = {
            user = {
                name = "CHANGE_ME";
                email = "changeme@example.com";
            };
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
