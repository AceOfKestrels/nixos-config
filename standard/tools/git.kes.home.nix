{ lib, ... }:

{
    programs.git.enable = true;
    programs.git.settings = {
        user = {
            name = "AceOfKestrels";
            email = "git@kestrels.dev";
        };
        core.editor = lib.mkForce "nvim";
    };
}
