{
    ...
}:

let
    # must be a separate module, as trying to access inputs directly throws an error
    hmFromFlake =
        { inputs, ... }:
        {
            imports = [ inputs.home-manager.nixosModules.home-manager ];
        };

    hmModule =
        if (builtins.tryEval <home-manager/nixos>).success then
            import <home-manager/nixos>
        else
            hmFromFlake;
in
{
    imports = [ hmModule ];

    home-manager.useGlobalPkgs = true;
    home-manager.useUserPackages = true;

    home-manager.backupFileExtension = "backup";
}
