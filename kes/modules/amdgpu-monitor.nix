{ config, pkgs, ... }:

# Check for AMDGPU errors and append them to a log file
# Use "tail -n50 /var/log/amdgpu-error-watch.log" to check
# https://chatgpt.com/c/68250a77-56a8-8003-bc24-942199f25a0d
let
    errorScript = pkgs.writeScriptBin "check-amdgpu-errors" ''
        journalctl -k -b --no-pager \
        | grep --color=never -E "amdgpu.*(Failed to initialize parser|ring gfx_.*timeout)" \
        >> /var/log/amdgpu-error-watch.log
    '';
in {
    systemd.services.check-amdgpu-errors = {
        description = "Scan dmesg for amdgpu parser/timeout errors";
        serviceConfig = {
            Type    = "oneshot";
            ExecStart = "${errorScript}";
        };
    };

    systemd.timers.check-amdgpu-errors = {
        description = "Run AMDGPU error scan every hour";
        wantedBy = [ "timers.target" ];
        timerConfig = {
            OnBootSec         = "10min";
            OnUnitActiveSec   = "1h";
        };
    };
}