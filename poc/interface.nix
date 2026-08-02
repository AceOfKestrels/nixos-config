{ kpkgs, ... }:

{

    kpkgs.packages = with kpkgs; [
        curl."1.2.3"
        vscode
        less.unstable
    ];

    environment.systemPackages = with kpkgs; [
        (fetch vscode."1.2.3")
    ];

    programs.vscode.package = with kpkgs; fetch vscode."1.2.3";
}
