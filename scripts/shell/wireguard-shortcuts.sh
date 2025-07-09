#! /bin/bash

wireguard() {
    case "$1" in
        up|down)
            __wg_toggle "$@"
        ;;
        list)
            for file in "$WIREGUARD_CONFS_DIR"/*.conf; do
                base=${file##*/}
                echo "${base%.conf}"
            done
        ;;
        *)
            echo "usage: wireguard <up|down|list> <network>"
        ;;
    esac
}

__wg_toggle() {
    if [ -z "$2" ]; then
        echo "usage: wireguard <up|down|list> <network>"
    fi

    case "$1" in
        up)
            sudo wg-quick up "$WIREGUARD_CONFS_DIR/$2.conf"
        ;;
        down)
            sudo wg-quick down "$WIREGUARD_CONFS_DIR/$2.conf"
        ;;
    esac
}