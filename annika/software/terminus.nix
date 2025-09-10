{
    pkgs,
    ...
}:
{

    environment.systemPackages = with pkgs; [
        termius # SSH Client
    ];
}
