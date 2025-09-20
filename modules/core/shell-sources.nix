{ inputs, ... }:

{
    imports = [ inputs.shell-sources.module ];
    programs.shellSources.enable = true;
}
