#! /bin/bash

# start a normal zsh/bash if tmux cannot start
if ! tmux start-server &>/dev/null; then
    if where zsh &>/dev/null; then
        bash -i -c 'echo "failed to start tmux server"; exec zsh'
    else
        bash -i -c 'echo "failed to start tmux server"; exec bash'
    fi
    return
fi

# parse arguments
if [ -n "$1" ]; then
    for arg in "$@"; do
        case $arg in
            --include-directory)
                includeDirectory=1
                break
            ;;
            --help|-h)
                echo "usage: tmux-attach-to-session [session-name] [options]"
                echo
                echo attach to the latest unattached tmux session matching session-name
                echo or create a new one when none is found
                echo
                echo "options"
                echo "  -h --help           show this help"
                echo "  --include-directory include the working directory in the session name"
                return 1
            ;;
            *)
                sessionNameArg="$1-";
                shift
            ;;
        esac
    done
fi

# build session base name
if [ "$includeDirectory" = 1 ]; then
    currentDir=$(realpath .)
    sessionNameArg="$sessionNameArg$currentDir-"
fi

# find existing session matching base name
if [ -n "$sessionNameArg" ]; then
    detachedSesions=$(tmux list-sessions | grep -v "attached" | grep -E "^$sessionNameArg.*?:")
else
    detachedSesions=$(tmux list-sessions | grep -v "attached")
fi
sessionName="${detachedSesions%%:*}"

# if no session was found, append a random id
if [ -z "$sessionName" ]; then
    sessionId=$(tr -dc 'A-Za-z0-9' < /dev/urandom | head -c 8 ; echo)
    sessionName="$sessionNameArg$sessionId"
fi

# attach to an existing session, otherwise create a new one
tmux new-session -A -s "$sessionName"