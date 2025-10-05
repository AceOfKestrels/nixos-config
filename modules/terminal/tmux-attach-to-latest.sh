#! /bin/bash

printf '\e]2; \a'
usage="usage: tmux-attach-to-session [session-name] [options]"

# start a normal zsh/bash if tmux cannot start
if ! tmux start-server &>/dev/null; then
    if where zsh &>/dev/null; then
        bash -i -c 'echo "failed to start tmux server"; exec zsh'
    else
        bash -i -c 'echo "failed to start tmux server"; exec bash'
    fi
    return
fi

if [ -n "$1" ]; then
    sessionNameArg="$1-";
    shift
fi

# parse arguments
while [ -n "$1" ]; do
    case "$1" in
        --include-directory|-d)
            if [ "$includeDirectory" = 1 ]; then
                echo "$usage"
                return 1
            fi
            includeDirectory=1
            shift
        ;;
        --title|-t)
            if [ "$title" = 1 ]; then
                echo "$usage"
                return 1
            fi
            shift
            if [ -z "$1" ]; then
                echo "$usage"
                return 1
            fi
            title="$1"
            shift
        ;;
        --help|-h)
            echo "$usage"
            echo
            echo attach to the latest unattached tmux session matching session-name
            echo or create a new one when none is found
            echo
            echo "options"
            echo "  -h --help               show this help"
            echo "  -d --include-directory  include the working directory in the session name"
            echo "  -t --title <title>      the title used for the terminal"
            return 1
        ;;
        *)
            echo "$usage"
            return 1
        ;;
    esac
done

if [ -n "$title" ]; then
    # shellcheck disable=SC2059
    printf "\e]2;$title\a"
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
exec tmux new-session -A -s "$sessionName"