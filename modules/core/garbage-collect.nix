{ ... }:

{
    # collect garbage automatically, every week
    nix.gc.automatic = true;
    nix.gc.dates = "weekly";

    # deduplicate store files
    nix.settings.auto-optimise-store = true;

    # keep store blobs for old generations up to 30 days
    nix.gc.options = "--delete-older-than 30d";

    # only keep the last five generations (otherwise boot partition can fill up too much)
    boot.loader.systemd-boot.configurationLimit = 5;
}
