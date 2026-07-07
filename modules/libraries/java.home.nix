{ pkgs, ... }:

{
    home.file."jdks/jdk17".source = pkgs.jdk17;
    home.file."jdks/jdk8".source = pkgs.jdk8;
}
