{ ... }:

{
    imports = [
        ../../modules/home-manager.nix
        ../../modules/home/catppuccin.nix
    ];

    home-manager.sharedModules = [
        ./home/vscode.home.nix
        ./home/catppuccin.home.nix
    ];
}
