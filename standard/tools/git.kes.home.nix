{ lib, ... }:

{
    programs.git.settings = {
        user = {
            name = "AceOfKestrels";
            email = "git@kestrels.dev";
        };
        core.editor = lib.mkForce "nvim";
    };
}
