#! /usr/bin/env bash

if [ -z "$1" ] || [ -z "$2" ]; then
    echo "usage: write-iso.sh <iso-path> <usb-path>"
    exit 1
fi

if ! [ -f "$1" ]; then
    echo "fatal: no such file: $1"
fi

lsblk "$2" >/dev/null || exit 1

if [[ "$(lsblk -n --raw "$2")" = *"/run/media/"* ]]; then
    echo "fatal: $2 is mounted"
    exit 1
fi

sudo dd bs=4M if="$1" of="$2" conv=fsync oflag=direct status=progress