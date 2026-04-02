{
    pkgs,
    ...
}:
{
    home.packages = with pkgs; [
        termius # SSH Client
    ];
}
