{ pkgs, ... }:
{
    environment.systemPackages = with pkgs; [
        rsync
    ];

    environment.shellAliases = {
        cp = "rsync -ahP";
        # We alias mv to our custom function defined below
        mv = "rsync_mv";
        # Added a dry-run version as a bonus
        mvd = "rsync_mv --dry-run";
    };

    programs.zsh.promptInit = ''
        # Custom function to make rsync act like a proper 'mv'
        rsync_mv() {
          # Use rsync to move files
          # "$@" passes all arguments (including flags like --dry-run)
          rsync -ahP --remove-source-files "$@" && \
          
          # Clean up empty directories left behind
          # This looks at the first argument (the source)
          if [ -d "$1" ]; then
            find "$1" -type d -empty -delete 2>/dev/null
          fi
        }
    '';
}
