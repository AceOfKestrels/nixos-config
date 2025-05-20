{ lib, config, pkgs, ... }:

{
    imports = [
        ../../modules/core/git.nix
        ../../modules/core/nvim.nix
    ];

    programs.git.config.core.editor = lib.mkForce "nvim";
}