{ config, pkgs, ... }:

{
    programs.git = {
        enable = true;

        config = {
            user = {
                name = "AceOfKestrels";
                email = "aceofkestrels@gmail.com";
            };
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
        git
        git-credential-manager
    ];
}