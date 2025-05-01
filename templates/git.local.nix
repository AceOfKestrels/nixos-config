{ config, pkgs, ... }:

{
    programs.git = {
        config = {
            user = {
                name = "AceOfKestrels";
                email = "aceofkestrels@gmail.com";
            };
        };
    };
}