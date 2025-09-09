{ system, nixpkgs, ... }:

let
    lib = (import nixpkgs { system = system; }).lib;
in
{
    importPkgs =
        p:
        import p {
            inherit system;
            config.allowUnfree = true;
        };

    inherit lib;
    inherit system;
}
