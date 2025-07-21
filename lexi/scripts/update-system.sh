#! /bin/sh

rebuild() {
    nixos-rebuild "$NIXOS_REBUILD_ACTION" \
        -I nixpkgs=/nix/var/nix/profiles/per-user/root/channels/nixos \
        -I "nixos-config=$NIXOS_SYSTEM_CONFIG" \
        "$@"
}

echo "starting update in 30 seconds"
sleep 30
echo "setting nixos channel to $NIXOS_CONFIG_CHANNEL"
nix-channel --add "$NIXOS_CONFIG_CHANNEL" nixos 
echo "updating channel"
nix-channel --update
echo "starting rebuild"
if ! rebuild --upgrade ; then

    echo "upgrade failed. reverting channel"
    nixos_version=$(cut --delimiter=. --fields=3 /run/current-system/nixos-version)
    channel="$(grep --fixed-strings --files-with-matches "$nixos_version" /nix/var/nix/profiles/per-user/root/channels-*-link/nixos/svn-revision | tail --lines=1 | cut --delimiter=- --fields=3)"

    nix-channel --rollback "$channel"

    echo "rebuilding without upgrade"
    rebuild
fi