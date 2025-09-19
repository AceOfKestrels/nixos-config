{
    kestrel,
    pkgs,
    ...
}:
{
    nixpkgs.overlays = kestrel.overlays.mkOverlays {
        termius = "9807714d6944a957c2e036f84b0ff8caf9930bc0";
    };
}
// {

    environment.systemPackages = with pkgs; [
        termius # SSH Client
    ];
}
