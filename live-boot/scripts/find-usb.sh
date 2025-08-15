#! /usr/bin/env bash

# shellcheck disable=SC2010
ls /dev/disk/by-id/usb-* | grep -v -e "-part"