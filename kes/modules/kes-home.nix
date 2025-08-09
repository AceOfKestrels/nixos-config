{ ... }:

{
    imports = [
        ../../modules/home-manager.nix
        ../../modules/home/plasma.nix
        ../../modules/home/catppuccin.nix
    ];

    home-manager.sharedModules = [
        ./home/vscode.home.nix
        ./home/plasma.home.nix
        ./home/catppuccin.home.nix
    ];
}
