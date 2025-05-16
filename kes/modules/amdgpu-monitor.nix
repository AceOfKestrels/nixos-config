{ config, pkgs, ... }:

# Check for AMDGPU errors and append them to a log file
# Use "tail -n50 /var/log/amdgpu-error-watch.log" to check
# https://chatgpt.com/c/68250a77-56a8-8003-bc24-942199f25a0d
{
    systemd.services.amdgpuErrorLogger = {
        description = "Log AMDGPU kernel errors to a dedicated file";
        after = [ "systemd-journald.service" ];
        wantedBy = [ "multi-user.target" ];

        serviceConfig = {
            # follow only kernel-level errors, and grep for "amdgpu"
            ExecStart = ''
                /bin/sh -c "exec journalctl -k -b -p err -f \
                | grep --color=never -E 'amdgpu.*(Failed to initialize parser|ring gfx_.*timeout)' \
                >> /var/log/amdgpu-error-watch.log"
            '';
            Restart     = "always";     # if it ever dies, restart
            RestartSec  = "5s";         # wait 5s before restart
            StandardOutput = "null";    # don't double-log to journal
            StandardError  = "null";
        };
    };

}