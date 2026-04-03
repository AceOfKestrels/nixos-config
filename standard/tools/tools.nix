{ pkgs, ... }:

{
    # Include core packages
    environment.systemPackages = with pkgs; [
        keepassxc
        nextcloud-client
        localsend
        dig # to have dns tools like nslookup
        pdfsam-basic
        gimp3
    ];
}
