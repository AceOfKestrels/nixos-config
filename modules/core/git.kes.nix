{ lib, ... }:

{
    programs.git.config = {
        user = {
            name = "AceOfKestrels";
            email = "aceofkestrels@gmail.com";
        };
        core.editor = lib.mkForce "nvim";
    };
}
