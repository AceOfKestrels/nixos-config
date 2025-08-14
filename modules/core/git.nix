{ pkgs, ... }:
let
    gcmWrapped = pkgs.symlinkJoin {
        name = "git-credential-manager-wrapped";
        paths = [ pkgs.git-credential-manager ];
        buildInputs = [ pkgs.makeWrapper ];
        postBuild = ''
            wrapProgram $out/bin/git-credential-manager \
              --set LD_LIBRARY_PATH ${
                  pkgs.lib.makeLibraryPath [
                      pkgs.libsecret
                      pkgs.glib
                      pkgs.curl
                      pkgs.krb5
                      pkgs.openssl
                  ]
              } \
              --set GCM_CREDENTIAL_STORE secretservice
        '';
    };
in
{
    programs.git = {
        enable = true;
        package = pkgs.gitFull;

        config = {
            user = {
                name = "CHANGE_ME";
                email = "changeme@example.com";
            };
            core.editor = "nano";
            alias.pfusch = "push --force";
            init.defaultBranch = "main";

            credential.helper = "manager";
            credential.credentialStore = "secretservice";
            safe.directory = "/etc/nixos/nixos-config";
        };
    };

    environment.systemPackages = with pkgs; [
        gcmWrapped
        xdg-utils # xdg-open so GCM can launch your browser
        libsecret # not strictly required (wrapped), but handy for tools like secret-tool
        seahorse # optional GUI to view saved creds
    ];
}
