{ ... }:

{
    imports = [
        ../../modules/home-manager.nix
    ];

    home-manager.sharedModules = [
        ./home/vscode.home.nix
    ];
}
