{ config, pkgs, ... }:

{
    imports = [
        ../../local/git.local.nix
    ];

    programs.git = {
        enable = true;

        config = {
            core.editor = "nano";
	    aliases = { 
	        pfusch = "push --force";
	    };
            init.defaultBranch = "main";
            credential.helper = "manager";
            credential.credentialStore = "secretservice";
        };
    };

    environment.systemPackages = with pkgs; [
        git-credential-manager
    ];
}
