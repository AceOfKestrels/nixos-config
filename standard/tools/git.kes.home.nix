{ lib, ... }:

{
    programs.git.config = {
        user = {
            name = "AceOfKestrels";
            email = "git@kestrels.dev";
        };
        core.editor = lib.mkForce "nvim";
    };
}
