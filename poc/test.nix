{
    lib,
    config,
    kestrix,
    pkgs,
    ...
}:

let
    fetchInternal =
        url:
        let
            src = builtins.getFlake url;
        in
        (import src {
            system = kestrix.system;
            overlays = [ ];
            config = config.nixpkgs.config or { allowUnfree = true; };
        });

    kpkgs = {
        most = {
            pname = "most";
            "1.2.3" = {
                pname = "most";
                url = "github:nixos/nixpkgs/074e2ab0ac3adbbd535d1cd29d98283c7501471a";
            };
        };
        kdePackages.kate = {
            pname = "kdePackages.kate";
            "1.2.3" = {
                pname = "kdePackages.kate";
                url = "github:nixos/nixpkgs/074e2ab0ac3adbbd535d1cd29d98283c7501471a";
            };
        };

        fetch =
            pkg@{ pname, ... }:
            let
                pathSegments = lib.splitString "." pname;
                imported = if builtins.hasAttr "url" pkg then fetchInternal pkg.url else pkgs;
            in
            lib.attrByPath pathSegments { } imported;
    };
in
{
    environment.systemPackages = with kpkgs; [
        (fetch most)
        (fetch kdePackages.kate)
    ];

    programs.zsh.shellInit = lib.debug.traceVal ''
        echo "src: ${(kpkgs.fetch kpkgs.kdePackages.kate).meta.name}"
    '';
}
