#! /bin/bash

__hasNoLocalChanges() {
    if [[ -n $(git status --porcelain) ]]; then
        return 1
    fi

    read -r behind ahead < <(git rev-list --left-right --count origin/HEAD...HEAD)

    if [ "$ahead" -gt 0 ]; then
        return 1
    fi

    return 0
}

__shellSourcesCheckForUpdates() {
    # Disable job control output
    set +m
    {
        cd "$SHELL_SOURCES_DIR" || return
        if ! git fetch --quiet; then
            return
        fi
        read -r behind ahead < <(git rev-list --left-right --count origin/HEAD...HEAD)
        if [ "$behind" -gt 0 ]; then
            echo "shell-sources has been updated."
            echo "run \"update-shell-sources\" to pull the changes."
        fi
        cd - > /dev/null || return
    } &
    disown

    set -m
}

update-shell-sources() {
    if [ ! -d "$SHELL_SOURCES_DIR" ]; then
        echo "shell sources directory not found, attempting to clone..."
        if git clone "$SHELL_SOURCES_REMOTE" "$SHELL_SOURCES_DIR" ; then
            exec "$SHELL"
            return 0
        else
            echo "failed to clone repository at $SHELL_SOURCES_REMOTE to $SHELL_SOURCES_DIR"
            return 1
        fi
    fi

    cd "$SHELL_SOURCES_DIR" || return 1

    if ! git fetch --quiet; then
        echo "failed to fetch changes from remote..."
    fi

    if [ "$1" = "-f" ] || [ "$1" = "--force" ]; then
        echo "cleaning local repository..."
        git restore . --quiet
        git clean --force --quiet -d
    else
        if ! __hasNoLocalChanges ; then
            echo "there are local changes. please resolve them manually or run \"update-shell-sources --force\" to overwrite them."
            return 1
        fi
    fi

    echo "updating..."

    git reset --hard origin/HEAD --quiet

    echo "updated successfully!"

    cd - > /dev/null || return 1
    exec "$SHELL"
}

if [ ! -d "$SHELL_SOURCES_DIR" ]; then
    echo "shell-sources repository not found at $SHELL_SOURCES_DIR"
    echo "run \"update-shell-sources\" to clone the repository."
    return 0
fi

# shellcheck disable=SC1090
source "$SHELL_SOURCES_DIR/$SHELL_SOURCES_SOURCE_ALL_FILE"

__shellSourcesCheckForUpdates
