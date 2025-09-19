{ kestrel, pkgs, ... }:

let
    tabSize = 4;
in
kestrel.mkHome {
    programs.vscode = {
        enable = true;
        package = pkgs.vscodium;
        mutableExtensionsDir = false;
    };

    programs.vscode.profiles.default = {
        enableUpdateCheck = false;
        enableExtensionUpdateCheck = false;
        userSettings = {
            "editor.mouseWheelZoom" = true;

            "window.newWindowDimensions" = "maximized";
            "editor.wordWrap" = "on";
            "editor.bracketPairColorization.enabled" = true;
            "editor.minimap.enabled" = true;
            "editor.minimap.renderCharacters" = true;
            "terminal.integrated.confirmOnExit" = "hasChildProcesses";
            "explorer.fileNesting.enabled" = true;
            "explorer.fileNesting.expand" = false;
            "explorer.fileNesting.patterns" = {
                "*.nix" = "$\{basename\}.home.nix";
            };
            "terminal.integrated.cursorStyle" = "line";
            "terminal.integrated.cursorStyleInactive" = "none";

            "editor.tabSize" = tabSize;
            "[nix]" = {
                "editor.tabSize" = tabSize;
            };
            "editor.detectIndentation" = false;

            "editor.formatOnSave" = true;

            "nix.enableLanguageServer" = true;
            "nix.serverPath" = "nixd";
            "nix.serverSettings" = {
                "nixd" = {
                    "formatting" = {
                        "command" = [
                            "nixfmt"
                            "--indent=${builtins.toString tabSize}"
                        ];
                    };
                };
            };
            "nix.hiddenLanguageServerErrors" = [
                "textDocument/definition" # bug in nixd I think?
                "textDocument/formatting" # nixd throws an error when trying to format invalid files
            ];

            "terminal.integrated.commandsToSkipShell" = [ "workbench.action.createTerminalEditor" ];
            "terminal.integrated.profiles.linux" = {
                "bash" = {
                    "path" = "bash";
                    "icon" = "terminal-bash";
                    "overrideName" = true;
                };
                "zsh" = {
                    "path" = "zsh";
                    "overrideName" = true;
                };
                "tmux" = {
                    "path" = "tmux-attach-to-latest";
                    "args" = [
                        "vscode-session"
                        "--include-directory"
                    ];
                    "icon" = "terminal-tmux";
                    "overrideName" = true;
                };
            };
            "terminal.integrated.defaultProfile.linux" = "tmux";
            "terminal.integrated.enablePersistentSessions" = false;
            "terminal.integrated.persistentSessionReviveProcess" = "never";

            "workbench.colorCustomizations" = {
                "terminal.background" = "#11111b";
                "terminal.foreground" = "#cdd6f4";
                "terminalCursor.background" = "#1e1e2e";
                "terminalCursor.foreground" = "#cdd6f4";
                "terminal.ansiBlack" = "#313244";
                "terminal.ansiRed" = "#f38ba8";
                "terminal.ansiGreen" = "#a6e3a1";
                "terminal.ansiYellow" = "#f9e2af";
                "terminal.ansiBlue" = "#89b4fa";
                "terminal.ansiMagenta" = "#cba6f7";
                "terminal.ansiCyan" = "#89dceb";
                "terminal.ansiWhite" = "#cdd6f4";
                "terminal.ansiBrightBlack" = "#6c7086";
                "terminal.ansiBrightRed" = "#f38ba8";
                "terminal.ansiBrightGreen" = "#a6e3a1";
                "terminal.ansiBrightYellow" = "#f9e2af";
                "terminal.ansiBrightBlue" = "#89b4fa";
                "terminal.ansiBrightMagenta" = "#cba6f7";
                "terminal.ansiBrightCyan" = "#89dceb";
                "terminal.ansiBrightWhite" = "#cdd6f4";
            };
        };

        keybindings = [
            {
                key = "ctrl+d";
                command = "editor.action.copyLinesDownAction";
                when = "editorTextFocus && !editorReadonly";
            }
            {
                key = "ctrl+[Backslash]"; # ctrl+#
                command = "editor.action.commentLine";
                when = "editorTextFocus && !editorReadonly";
            }
            {
                key = "alt+enter";
                command = "editor.action.quickFix";
                when = "editorHasCodeActionsProvider && textInputFocus && !editorReadonly";
            }
            {
                key = "ctrl+r";
                command = "editor.action.rename";
                when = "editorHasRenameProvider && editorTextFocus && !editorReadonly";
            }
            {
                key = "ctrl+r";
                command = "-workbench.action.openRecent";
            }
            {
                key = "ctrl+t";
                command = "workbench.action.createTerminalEditor";
                when = "true";
            }
            {
                key = "ctrl+w";
                command = "workbench.action.closeWindow";
                when = "!editorIsOpen";
            }
            {
                key = "ctrl+t";
                command = "-workbench.action.showAllSymbols";
            }
            {
                key = "ctrl+tab";
                command = "workbench.action.nextEditor";
            }
            {
                key = "ctrl+shift+tab";
                command = "workbench.action.previousEditor";
            }
        ];

        extensions = with pkgs.vscode-extensions; [
            hediet.vscode-drawio
            ms-python.python
        ];
    };
}
