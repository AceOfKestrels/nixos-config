{ pkgs, ... }:

let
    tabSize = 4;
in
{
    programs.vscode = {
        enable = true;
        mutableExtensionsDir = false;
    };

    programs.vscode.profiles.default = {
        enableUpdateCheck = false;
        enableExtensionUpdateCheck = false;
        userSettings = {
            "editor.mouseWheelZoom" = true;

            "editor.wordWrap" = "on";
            "workbench.colorTheme" = "Default Dark Modern";
            "editor.bracketPairColorization.enabled" = true;
            "editor.minimap.enabled" = true;
            "editor.minimap.renderCharacters" = true;
            "terminal.integrated.confirmOnExit" = "hasChildProcesses";
            "explorer.fileNesting.enabled" = true;
            "explorer.fileNesting.expand" = false;
            "explorer.fileNesting.patterns" = {
                "*.nix" = "$\{basename\}.home.nix";
            };

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
            "terminal.integrated.fontFamily" = "MesloLGS Nerd Font";
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
        ];

        extensions = with pkgs.vscode-extensions; [
            hediet.vscode-drawio
        ];
    };

    fonts.fontconfig.enable = true;
    home.packages = with pkgs.nerd-fonts; [
        meslo-lg
    ];
}
