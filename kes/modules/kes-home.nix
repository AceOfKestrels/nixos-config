{ ... }:

{
    imports = [
        ../../modules/home-manager.nix
        ../../modules/desktop/plasma-manager.nix
    ];

    home-manager.sharedModules = [
        ./home/vscode.home.nix
        ./home/plasma.home.nix
    ];
}
