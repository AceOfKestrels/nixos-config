# { config, pkgs, ... }:

# # DOES NOT WORK RN
# # Running sudo in a user service does not work correctly
# # But also running git in a root service is also broken
# {
#     programs.git.enable = true;

#     systemd.user.services.autoupdate-lexi = {
#         description = "Pull config from remote and rebuild on system start";
#         enable = true;

#         wantedBy = [ "default.target" ];

#         path = [ pkgs.git pkgs.bash pkgs.nixos-rebuild pkgs.sudo ];

#         script = builtins.readFile ../scripts/update-system.sh;

#         environment = {
#             NIXOS_CONFIG_DIR = "/etc/nixos/nixos-configs";
#             NIXOS_CONFIG_REMOTE_BRANCH = "lexi";
#             NIXOS_CONFIG_CHANNEL = "https://nixos.org/channels/nixos-25.05";
#         };

#         serviceConfig = {
#             Type = "oneshot";
#             RemainAfterExit = true;
#             StandardOutput  = "journal";
#             StandardError   = "journal";
#         };
#     };

#     systemd.user.timers.autoupdate-lexi = {
#         description = "Run autoupdate-lexi once at boot";
#         enable      = true;
#         wantedBy    = [ "timers.target" ];

#         timerConfig = {
#             OnBootSec = "2min";                      # delay a bit after each reboot
#             Unit      = "autoupdate-lexi.service";  # fires the above service
#         };
#     };
# }