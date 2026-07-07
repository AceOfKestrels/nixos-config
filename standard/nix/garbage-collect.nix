{ ... }:

{
    # deduplicate store files
    nix.settings.auto-optimise-store = true;

    # only keep the last five generations (otherwise boot partition can fill up too much)
    boot.loader.systemd-boot.configurationLimit = 5;

    # use nh clean for garbage collect
    programs.nh.enable = true;
    programs.nh.clean = {
        enable = true;
        # keep store paths that are younger than 30 days or included in the last 5 generations
        extraArgs = "--keep 5 --keep-since 30d";
        dates = "daily";
    };
}
