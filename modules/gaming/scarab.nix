{
    pkgs,
    ...
}:

{
    environment.systemPackages = with pkgs; [
        scarab
    ];
}
